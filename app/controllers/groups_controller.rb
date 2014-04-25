class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new( group_params )
    
    respond_to do |format|
      if @group.save

        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Put a new member into a group
  def add_member
   current_user.groups.find(params[:group_id]).users << User.find( params[:group][:user_ids] )
   respond_to do |format|
    format.html {redirect_to :back}
    format.js
   end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = current_user.groups.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :user_ids => [])
    end
end
