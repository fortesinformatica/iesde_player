module IesdePlayer
  module VideoHelper

      def iesde_player_div(id='palco', params)
        width = params[:width] || '574'
        height = params[:height] || '469'
        javascript_tag(render_video(id, width, height, flashvars_cleaner(params), params_cleaner(params))) +
        content_tag(:div, nil, id: id)
      end

      def iesde_player_demo(url, parameters)
        html_params = {
          src: "http://web.videoaulasonline.com.br/player/player.swf", 
          flashvars: "autostart=#{parameters[:autostart] ? 'true' : 'false'}&streamer=#{url}", 
          allowfullscreen: "true",
          allowscriptaccess: "always",
          allownetworking: "all",
          autostart: (parameters[:autostart] || false)
        }
        content_tag( :embed, nil, html_params.merge(parameters[:html] || {}))
      end

      private

      def flashvars_cleaner(params)
        hash = {}
        hash[:autostart] = params[:auto_start] || "false"
        hash[:themeColor] = params[:theme_color] || "0395d3"
        hash[:mode] = params[:mode] || "fit"
        hash[:scaleMode] = params[:scale_mode] || "stretch"
        hash[:frameColor] = params[:frame_color] || "ffffff"
        hash[:fontColor] = params[:font_color] || "000000"
        hash[:user] = params[:user] || ""
        hash[:pass] = params[:pass] || ""
        hash[:course] = params[:course] || ""
        hash[:movieid] = params[:movie_id] || ""
        hash[:courseType] = params[:course_type] || "C"
        hash
      end

      def params_cleaner(params)
        hash = {}
        hash[:allowFullScreen] = params[:allow_full_screen] || "true"
        hash[:allowscriptaccess] = params[:allow_script_access] || "always"
        hash[:quality] = params[:quality] || "high"
        hash[:AllowNetworking] = params[:allow_networking] || "all"
        hash
      end

      def render_video(id, width, height, flashvars, params)
        <<-EOS
          var playerLocation = '#{asset_url("Player.swf")}';
          var idDiv = '#{id}';
          var width = '#{width}';
          var height = '#{height}';
          var flashvars = JSON.parse('#{flashvars.to_json}');
          var params = JSON.parse('#{params.to_json}');

          var attributes = {
            id: '#{id}',
            name: '#{id}'
          };
          renderizarVideoPlayerIesde(playerLocation, idDiv, width, height, flashvars, params, attributes);      
        EOS
      end

  end
end
