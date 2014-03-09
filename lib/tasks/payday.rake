require 'holiday_jp'
namespace :payday do
  desc "payday"
  task :payday => :environment do

    date=DateTime.new(DateTime.now.year,DateTime.now.month,20)

    if HolidayJp.holiday?(date)
        date=date.prev_day
    end

    if date.wday == 0
      date=date.prev_day.prev_day
    elsif date.wday == 6
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
