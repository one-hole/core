# 赛程爬取模块
# 暂时只对 T2Score 爬取

module DotaCrawler
  class Scheduler
    T2Url = "https://www.t2score.com/api/front/schedule/schedule_three_days"

    def self.run
      @resp = Request.new(T2Url, "get", headers, nil).exec
      parse
      return nil
    end

    def self.parse
      datas = JSON.parse(@resp.body)["list"].select { |data| ("dota2" == data["game_category"] && "upcoming" == data["state"]) }
      datas.each { |data| process(data) }
      nil
    end

    def self.process(data)
      @battle = Battle.find_by(trdid: "t2_#{data["_id"]}")

      if @battle.nil?
        do_create(data)
      else
        do_update(data)
      end
      nil
    end

    def self.do_update(data)
    end

    def self.do_create(data)
      load_league(data)
      load_teams(data)
      Battle.create(
        status: 0,
        left_team: @left_team,
        right_team: @right_team,
        league: @league,
        start_time: data["start_time"],
        format: data["bo"],
        game_id: 1,
        trdid: "t2_#{data["_id"]}"
      )
    end

    # 1. 通过 trdid 查找 League，若不存在
    # 2. 通过 name 和 tag 查找 League
    # 3. 若依旧不存在、则 创建 League
    def self.load_league(data)

      @league = League.find_by(trdid: "t2_#{data["league_id"]["_id"]}")
      if nil == @league
        @league = League.by_names([data["league_id"]["name"],data["league_id"]["tag"], data["league_name"]], 1)
      end

      if nil == @league
        @league = League.create(
          game_id: 1,
          status:  1,
          name: data["league_id"]["name"],
          logo: data["league_id"]["icon"],
          trdid: "t2_#{data["league_id"]["_id"]}"
        )
      end
      return @league
    end
    
    def self.load_teams(data)
      @left_team = load_team(data["left_team"])
      @right_team = load_team(data["right_team"])
    end
    
    # 先通过 ID 去找队伍、然后通过名字去匹配队伍
    def self.load_team(data)
      team = Team.find_by(trdid: "t2_#{data["_id"]}")
      if nil == team
        team = Team.by_names([data["tag"]], 1)
      end

      if nil == team
        team = Team.create({
          game_id: 1,
          abbr: data["tag"],
          logo: data["logo"],
          trdid: "t2_#{data["_id"]}"
        })
      end
      return team
    end

    # 0. 如果存在已经有的 Battle 那么更新属性即可
    # 1. 找到对应的 League 或者新建 League（新建之后要把图片传入到阿里云）
    # 2. 找到对应的 Team 或者 新建 Team
    # 3. 新建 Battle（应该有全局的）

    def self.headers
      {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0) Gecko/20100101 Firefox/68.0",
        "Refer": "https://www.t2score.com/"
      }
    end
  end
end
