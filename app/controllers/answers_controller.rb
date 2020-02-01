class AnswersController < ApplicationController
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      
      redirect_to question_path(@question), notice: '回答投稿完了'
      
    else
      
      redirect_to question_path(@question), alert: '回答失敗'
      # render question_path
      # flash[:alert] = '回答失敗'
      
    end
  end
  
  def edit
    # @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  
  def update
    # @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    
    if @answer.update(answer_params)
      
      redirect_to question_path(@question), notice: '回答編集完了'
      
    else
      flash[:alert] = '回答編集失敗'
      render :edit
    end
  end
  
  def destroy
    # @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    
    @answer.destroy
    redirect_to question_path(@question), notice: '削除完了'
      
  end
  
  private
  
  def set_question
    @question = Question.find(params[:question_id])
  end

   def answer_params
     params.require(:answer).permit(:content, :name, :question_id)
   end
end