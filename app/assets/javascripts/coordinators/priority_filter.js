$(function () {
  $('#priority_filter').change(function () {
    let priority = $(this).val();
    $.ajax({
      url: "/attendances/filter_by_priority",
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      type: "POST",
      data: {
        priority_student: priority
      },
      dataType: 'json',
      success: function (data) {
        $('.attendances-list').html(data.html);
      }
    })
  });
})