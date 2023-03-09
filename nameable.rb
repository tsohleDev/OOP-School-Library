class Nameable
  def correct_name
    # throw NotImplementedError
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
