class ExamController < ApplicationController
  before_action :require_login
  def cabinet
  end

  def exam_process
    ex = Examine.new(user_id: session[:current_user_id], score: 0)
    ex.save
    @arr = []
    loop do
      rand_number = rand(1..12)
      if !@arr.include? rand_number
        @arr.push(rand_number)
      end
      break if @arr.length==10
    end
  end

  def exam_result
  end

  def exam_update
    ex = Examine.last
    lastscore = ex.score
    var = Variant.find_by(id: params[:answer])
    if !Answer.find_by(examine_id: Examine.last, quest_id: var.question_id)
      ans = Answer.new(examine_id: ex.id, quest_id: var.question_id, user_answer: var.id)
      ans.save
      if var.correct == true 
        ex.update(score: lastscore+1)
      end
    end
  end

  def require_login
    redirect_to root_path if session[:current_user_id].nil?
  end
end
