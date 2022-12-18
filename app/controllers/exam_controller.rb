class ExamController < ApplicationController
  def cabinet
  end

  def exam_process
    ex = Examine.new(user_id: session[:current_user_id], score: 0)
    ex.save
  end

  def exam_result
  end

  def exam_update
    ex = Examine.last
    lastscore = ex.score
    if Variant.find_by(id: params[:answer]).correct == true 
      ex.update(score: lastscore+1)
    end
  end
end
