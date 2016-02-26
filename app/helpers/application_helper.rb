module IesdePlayer
  module ApplicationHelper
    def iesde_video flashvars, params

        js = raw(
        <<-EOS
          var flashvars = {
            autostart: "#{flashvars[:auto_start]}",
            themeColor: "#{flashvars[:theme_color]}",
            mode: "#{flashvars[:mode]}",
            scaleMode: "#{flashvars[:scale_mode]}",
            frameColor: "#{flashvars[:frame_color]}",
            fontColor: "#{flashvars[:font_color]}",
            user: "#{flashvars[:user]}",
            pass: "#{flashvars[:pass]}",
            course: "#{flashvars[:course]}",
            movieid: "#{flashvars[:movie_id]}",
            courseType: "#{flashvars[:course_type]}"
          }; 
            
          var params = {
            allowFullScreen: "#{params[:allow_full_screen]}",
            allowscriptaccess: "#{params[:allow_script_access]}",
            quality: "#{params[:quality]}",
            AllowNetworking: "#{params[:allow_networking]}"
          };
          var attributes = {
              id: 'palco',
              name: 'palco'
          };
          swfobject.embedSWF('#{asset_url("Player.swf")}', 'palco', '574', '469', '9.0.0', 'expressInstall.swf', flashvars, params, attributes);
        EOS
        )

        javascript_tag(js) +
        content_tag(:div, nil, id: 'palco', style: "width: 574px; height: 469px;")
      end

  end
end
