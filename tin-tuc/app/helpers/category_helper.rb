module CategoryHelper
		# def dequy(parent=0,char="")
  #           @category=Category.all
  #           @children=[] 
  #           @i=0
  #           @category.each do |cat|
  #               if cat.parent==parent
  #                   @children.push(cat)
  #               end
  #           end 
  #           @children.each do |value,key|
                
  #                if value.parent==0
  #               @char=""
  #               else
  #               @char+="-"
  #               end
                
  #             raw "<option value='#{value.id}'>"
  #               @char+value.name
  #             raw '</option>'               
  #               dequy(value.id,@char) 
  #           end 
  #       end
  # def dequy(parent=0,char="")
  #           @category=Category.all
  #           @children=[] 
  #           @i=0
  #           @category.each do |cat|
  #               if cat.parent==parent
  #                   @children.push(cat)
  #               end
  #           end 
  #           @children.each do |value,key|
                
  #                if value.parent==0
  #               @char=""
  #               else
  #               @char+="-"
  #               end
                
  #               @select="<option>"+@char+value.name+"</option>"
                           
  #               dequy(value.id,@char) 
                
  #           end 
  #           return @select
  #       end
  
end