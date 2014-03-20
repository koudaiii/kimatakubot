require 'holiday_jp'
namespace :payday do
  desc "payday"
  task :payday_for_this_month => :environment do

    #Your company Payday is the 20th of each month.
    date=DateTime.new(DateTime.now.year,DateTime.now.month,20)

    #Payday is a business day, holidays and Saturday and Sunday are not included.
    while  HolidayJp.holiday?(date) or date.wday == 0 or date.wday == 6 do
        date=date.prev_day
    end

    create(date)
  end
  def create(date)
    payday=Payday.new
    payday.title="今日は給料日です"
    payday.payday=date
    payday.save
  end
end
