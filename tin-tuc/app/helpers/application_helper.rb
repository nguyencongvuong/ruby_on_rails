module ApplicationHelper
	def convert_string(string)
        @convert=string.mb_chars.downcase
        @convert=@convert.gsub(/[áằàảạãăắằặẵấầẩậẫâ]/,"a")
        @convert=@convert.gsub(/[êếểệễềéẻèẽẹé]/,"e")
        @convert=@convert.gsub(/[ôổồốộóòỏõọơỡởợờớ]/,"o")
        @convert=@convert.gsub(/[ưửứữựừúủùụũ]/,"u")
        @convert=@convert.gsub(/[íỉìịĩ]/,"i")
        @convert=@convert.gsub(/[ýỷỳỵỹ]/,"y")
        @convert=@convert.gsub(/[đ]/,"d")
        @convert=@convert.gsub(/[{}!“”.…–:?]/,'')
        @convert=@convert.gsub( /\[/,'')
        @convert=@convert.gsub( /\]/,'')
        @convert=@convert.gsub(/[%@&",'"',"'","  ","   "]/," ")
        @convert=@convert.gsub(/  /," ")
        @convert=@convert.gsub(/["---","--",",","\/","\\","|","_","+",' ']/,"-")
        # @convert=@convert.gsub(/" "/,"-")
        return @convert
  end

	def paginate(per_page,path,model)
   		page=params[:page]
        if page.nil?
            page=1
        else
            page=params[:page].to_i 
        end
        start=(page-1)*per_page
        finish=page*per_page
        total=(model.all.size/per_page.to_f).ceil
        # @new=New.find_each(start: start,finish:finish)
        @new=model.limit(per_page).offset(start)
        @link=Array.new 
   
   for i in 1..total
   if i!=page
   	 	@link.push(raw "<li>")
        @link.push(link_to i,path+"?page=#{i}")
        @link.push(raw "</li>")
    else 
        @link.push(raw "<li class='disabled'><a>")
        @link.push(i)
        @link.push(raw "</a></li>")
    
   end
   end
   return array={:link=>@link,:query=>@new}
    end

    def paginate_fontend(per_page,path,model)
        page=params[:page]
        if page.nil?
            page=1
        else
            page=params[:page].to_i 
        end
        start=(page-1)*per_page
        finish=page*per_page
        total=(model.size/per_page.to_f).ceil
        # @new=New.find_each(start: start,finish:finish)
        @new=model.limit(per_page).offset(start)
        @link=Array.new 
   
   for i in 1..total
   if i!=page
        @link.push(raw "<li>")
        @link.push(link_to i,path+"?page=#{i}")
        @link.push(raw "</li>")
    else 
        @link.push(raw "<li class='disabled'><a>")
        @link.push(i)
        @link.push(raw "</a></li>")
    
   end
   end
   return array={:link=>@link,:query=>@new}
    end
  

end
