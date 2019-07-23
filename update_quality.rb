require 'award'

def update_quality(awards) 
 
  awards.each do |award| # O(n) - Linear - Time Complexity  ( No nested loops )
                         # O(1) - Space Complexity - ( No additional data structures which are consuming memory )

    return award if ("Blue Distinction Plus" == award.name)  # Return immediately for performance 

           blue_first = ("Blue First" == award.name)  
            blue_star = ("Blue Star" == award.name)    
         blue_compare = ("Blue Compare" == award.name)
    quality_in_bounds = (award.quality > 0 && award.quality < 50) 

    unless (!quality_in_bounds) # Check if the quality is exclusively between 0 and 50 ?
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
    
    award.expires_in -= 1  # Everyday the awards expires_in value decreases by one day 
    expired = (award.expires_in < 0)
   
    unless (!expired) # Check if the award has expired
      if (blue_first)
        award.quality += 1 if award.quality < 50
      elsif (!blue_first && !blue_compare && quality_in_bounds)
        award.quality -= 1 if !blue_star
        award.quality -= 2 if blue_star
      else 
         award.quality -= award.quality
      end
    end

  end
end