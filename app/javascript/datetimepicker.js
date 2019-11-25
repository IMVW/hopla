import datetimepicker from "jquery-datetimepicker"
  const iniDatePicker = () => {
    $('.picker').datetimepicker({
      timepicker: true,
      datepicker: true,
      format: 'Y-m-d H:i',
      hours12: false,
      step: 15,
      yearStart: 2019,
      yearEnd: 2021
    })
  }
export default iniDatePicker
