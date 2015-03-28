class LogsController < ApplicationController
  before_filter :find_log, :only => [:edit, :update, :destroy]
  
  # GET /logs
  # GET /logs.xml
  def index
    if params[:user_id]
      @logs = Log.where(user_id: params[:user_id]).order("date desc")
    elsif params[:date]
      @logs = Log.where(date: params[:date]).order("date desc")
    elsif params[:tag]
      @logs = Log.where("tags like '%#{params[:tag]}%'").order("date desc")
    else
      @logs = Log.order("date desc")
    end
    
    @log_summary = Log.includes(:user).select("user_id, count(distinct date) as total_days, sum(minutes) as total_minutes").group(1).order("3 desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  # GET /logs/1
  # GET /logs/1.xml
  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /logs/new
  # GET /logs/new.xml
  def new
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.xml
  def create
    @log = current_user.create_log params[:log]

    respond_to do |format|
      if @log.save
        format.html { redirect_to(@log, :notice => 'Log was successfully created.') }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logs/1
  # PUT /logs/1.xml
  def update
    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to(@log, :notice => 'Log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.xml
  def destroy
    @log.destroy

    respond_to do |format|
      format.html { redirect_to(logs_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def find_log
      @log = Log.find(params[:id])
      if @log.user == current_user || current_user.admin?
        return @log
      else
        raise ActiveRecord::RecordNotFound
      end
    end
end
