require 'holiday_jp'
namespace :bonus do
  desc "bonus_for_this_month"
  task :bonus_for_this_month => :environment do

    #Your company bonus is the 20th of each month.
    date=DateTime.new(DateTime.now.year,DateTime.now.month,10)

    #bonus is a business day, holidays and Saturday and Sunday are not included.
    bonus_at = bonus_this_month(date)
    bonus_create(bonus_at)

  end

  desc "bonus of each month of 2050"
  task :bonus_of_each_month => :environment do

     #Your company bonus is the 20th of each month.
    date=DateTime.new(ENV['year'].to_i,ENV['month'].to_i,10)

    while date.year != 2051 do
      bonus_at = bonus_this_month(date)
      bonus_create(bonus_at)
      date=date >> 6
    end
  end

  def bonus_create(bonus_at)
    bonus=Payday.new
    bonus.title="今日はぼおおなすうぅ！"
    bonus.payday=bonus_at
    bonus.save
  end

  def bonus_this_month(date)
    while  HolidayJp.holiday?(date) or date.wday == 0 or date.wday == 6 do
      date=date.prev_day
    end
    date
  end
end
