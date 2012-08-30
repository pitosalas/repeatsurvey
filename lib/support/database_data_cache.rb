require 'active_support/core_ext/hash'

class DatabaseDataCache
  def initializer
  end

# Generate a result from pulling data from database. Cache it for next time.
#
# arg_hash contains three keys:
# program: 'id' of a program or :na
# question: 'id' of a question
# respondent: 'id' of a respondent
# round: :all, meaning all rounds
# Returns an array of the responses to that question, for each round in turn
#
  def self.get(arg_hash)
    arg_hash.assert_valid_keys(:question, :respondent, :round, :program)
    result = self.read_cache(arg_hash)
    return result if result.present?
    if (arg_hash[:round] == :all)
      values_map = all_rounds(arg_hash[:question], arg_hash[:respondent])
      set_cache(arg_hash, values_map)
    elsif (arg_hash[:respondent] == :all)
      values_map = all_respondents(arg_hash[:question], arg_hash[:round])
      set_cache(arg_hash, values_map)
    else
      raise ArgumentError("no matching arguments in DatabaseDataCache #{arg_hash}")
    end
  end

  def self.all_rounds(q, r)
    values = Value.where(:question_id => q, respondent_id: r).joins(:round).order("number")
    values.map { |v| v.value.to_i }
  end

  def self.all_respondents(q, r)
    rails ArgumentError unless q.class == Fixnum && r.class == Fixnum
    values = Value.where(:question_id => q, round_id: r).joins(:respondent)
    values.map { |v| v.value.to_i }
  end

  def self.dump_cache
    @hash ||= {}
    @hash.inspect
  end

  def self.read_cache key
    @hash ||= {}
    @hash[key]
  end

  def self.set_cache key, value
    @hash ||= {}
    @hash[key] = value
  end

end
