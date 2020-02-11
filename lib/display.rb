class Display

  def format(array)

    array.each do |record|
      output = 
      record[:day] + " " + 
      record[:mday].to_s + " " +
      record[:month] + " " +
      record[:date] + " - " +
      record[:customer].join(", ")

      puts output
    end
  end
  
end
