require 'active_support/core_ext/hash'
require 'database_data_cache'

class ReportPresenter

# coords is a hash:
#   program: 'id' if program or :all or :na
#   question: 'id' of a question or :all or :na
#   respondent: 'id' of a respondent or :all or :na
#   round: 'id' of a round
  def initialize coords, datasource = DatabaseDataCache
    coords.assert_valid_keys(:question, :respondent, :round, :program)
    @coords = coords;
    @datasource = datasource
  end

  def round_summary_string
    rails PresenterError unless @coords[:respondent] == :all
    round_results = @datasource.get(@coords)
    return compute_stats round_results
  end

  def compute_stats ints
    count = 0
    maximum = -100
    minimum = 100
    gt_2 = 0
    gt_3 = 0
    all_blank = true
    tot = 0
    ints.each do |i|
      count += 1
      tot += i
      maximum = i if i > maximum
      minimum = i if i < minimum
      gt_2 += 1 if i > 2
      gt_3 += 1 if i > 3
    end
    avg_s = "%05.2f" % (1.0 * tot / count)
    return "#: #{count},\n" + 
           "Avg: #{avg_s},\n"+
           "> 2: #{gt_2},\n" + 
           "> 3: #{gt_3}"
  end
end

class PresenterError < ArgumentError
end

