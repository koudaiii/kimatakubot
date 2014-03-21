require 'holiday_jp'
namespace :payday do
  desc "payday_for_this_month"
  task :payday_for_this_month => :environment do

    #Your company Payday is the 20th of each month.
    date=DateTime.new(DateTime.now.year,DateTime.now.month,20)

    #Payday is a business day, holidays and Saturday and Sunday are not included.
    payday_at = payday_this_month(date)
    create(payday_at)

  end

  desc "payday　of each month of 2050"
  task :payday_of_each_month => :environment do

     #Your company Payday is the 20th of each month.
    date=DateTime.new(ENV['year'].to_i,ENV['month'].to_i,20)

    while date.year != 2051 do
      payday_at = payday_this_month(date)
      create(payday_at)
      date=date.next_month
    end
  end

  def create(payday_at)
    payday=Payday.new
    payday.title="今日は給料日です"
    payday.payday=payday_at
    payday.save
  end

  def payday_this_month(date)
    while  HolidayJp.holiday?(date) or date.wday == 0 or date.wday == 6 do
      date=date.prev_day
    end
    date
  end
end
