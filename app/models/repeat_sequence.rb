class RepeatSequence < ActiveRecord::Base
  
  belongs_to :sequence

  def start_seq
    Sequence.find(start_sequence_id)
  end

  def end_seq
    Sequence.find(end_sequence_id)
  end

end
