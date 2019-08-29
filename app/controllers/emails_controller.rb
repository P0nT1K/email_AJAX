class EmailsController < ApplicationController
    def index
        @emails = Email.all
    end

    def create
        @email = Email.new(object: Faker::Book.title, body: Faker::Lorem.paragraph, read: false)
        @email.save
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js { }
        end  
    end
    
    def show
        @email = Email.find(params[:id])
        @email.update(read: true) 
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js { }
        end 
    end

    def destroy 
        @email = Email.find(params[:id])
        @email.destroy
        respond_to do |format|
          format.html{redirect_to root_path}
          format.js {}
        end
    end
    
    def update
        @email = Email.find(params[:id])
        if (@email.read == true) 
        @email.update(read: false)
        else
        @email.update(read: true) 
        end
        respond_to do |format|
            format.html{redirect_to tasks_path}
            format.js {}
          end
    end

    private

  def email_params
    params.permit(:read)
  end
end
