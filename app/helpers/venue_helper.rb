module VenueHelper
  def label_status working_time
    if working_time.open?
      content_tag :label,
        class: "form-label status label label-primary label_#{working_time.id}" do
        working_time.status
      end
    else
      content_tag :label,
        class: "form-label status label label-danger label_#{working_time.id}" do
        working_time.status
      end
    end
  end
end
