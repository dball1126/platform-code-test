require 'award'

def update_quality(awards)
 
  awards.each do |award|
   
    return award if ("Blue Distinction Plus" == award.name)

    blue_first =            ("Blue First" == award.name)
    blue_star =             ("Blue Star" == award.name)
    blue_compare =          ("Blue Compare" == award.name)
    quality_in_bounds =     (award.quality > 0 && award.quality < 50)

    unless (!quality_in_bounds)
      if (blue_compare)
        award.quality += 1
        award.quality += 1 if award.expires_in < 11
        award.quality += 1 if award.expires_in < 6
      elsif (!blue_first && !blue_compare && blue_star)
        award.quality -=2
      elsif(!blue_first && !blue_compare && !blue_star)
        award.quality -=1
      else
        award.quality += 1
      end
    end
    
    award.expires_in -= 1
    expired = (award.expires_in < 0)
   
    unless(!expired)
      
      if !blue_first
        if !blue_compare
          award.quality -= 1 if quality_in_bounds && !blue_star
          award.quality -= 2 if quality_in_bounds && blue_star
          
        else
          
          award.quality -= award.quality
        end
      else
       award.quality += 1 if award.quality < 50
  
      end
    end
   
  end
  
  
  
  
  
  
  
  
end
