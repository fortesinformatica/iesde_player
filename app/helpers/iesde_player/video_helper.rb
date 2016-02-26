module IesdePlayer
  module VideoHelper

      def iesde_player_div(id='palco', params)
        width = params[:width] || '574'
        height = params[:height] || '469'
        javascript_tag(render_video(id, width, height, flashvars_cleaner(params), params_cleaner(params))) +
        content_tag(:div, nil, id: id)
      end

      private

      def flashvars_cleaner(params)
        hash = {}
        hash[:autostart] = params[:auto_start] || ""
        hash[:themeColor] = params[:theme_color] || ""
        hash[:mode] = params[:mode] || ""
        hash[:scaleMode] = params[:scale_mode] || ""
        hash[:frameColor] = params[:frame_color] || ""
        hash[:fontColor] = params[:font_color] || ""
        hash[:user] = params[:user] || ""
        hash[:pass] = params[:pass] || ""
        hash[:course] = params[:course] || ""
        hash[:movieid] = params[:movie_id] || ""
        hash[:courseType] = params[:course_type] || ""
        hash
      end

      def params_cleaner(params)
        hash = {}
        hash[:allowFullScreen] = params[:allow_full_screen] || ""
        hash[:allowscriptaccess] = params[:allow_script_access] || ""
        hash[:quality] = params[:quality] || ""
        hash[:AllowNetworking] = params[:allow_networking] || ""
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
