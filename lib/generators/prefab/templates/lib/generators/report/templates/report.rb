module Reporting
  module <%= file_name.camelize %>
    class << self
      def details
        dtr = <%= class_name %>.all
        results = []
        dtr.each do |record|
          results << {
            :name => record.name
          }
        end
        results
      end

      def export_excel(filename)
        start = Time.now
        @recon = Reporting::<%= file_name.camelize %>.details
        output = StringIO.new

        Spreadsheet.client_encoding = 'UTF-8'
        report = Spreadsheet::Workbook.new
        sheet = report.create_worksheet
        sheet.name = "HotelEngine <%= file_name.titleize %> Report"
        headers = ["Name"]

        num_format = Spreadsheet::Format.new(:number_format => '0')
        dec_format = Spreadsheet::Format.new(:number_format => '0.00')
        curr_format = Spreadsheet::Format.new(:number_format => '$0.00')

        sheet.row(0).concat headers.flatten

        @recon.each_with_index do |eq, index|
          row = sheet.row(index+1)
          row.push eq[:name]
        end

        final_time = Time.now - start
        if Rails.env != "development"
          http = Net::HTTP.new("api.hotelengine.com")
          request = Net::HTTP::Get.new("/job_timers?time=#{final_time}")
          response = http.request(request)
        end
        if filename.blank?
          report.write(output)
          return output.string
        else
          file = "/tmp/#{filename}_#{Date.today.strftime('%Y%d%m')}.xls"
          report.write(file)
          return file
        end
      end
    end
  end
end
