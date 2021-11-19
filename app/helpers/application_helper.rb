module ApplicationHelper
    def youtube_video(video)
        render :partial => 'shared/video', :locals => { :video => video }
    end 
end
