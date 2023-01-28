List<DateTime> _getTrimesterDates(DateTime selectedDate) {
  // Assume a typical pregnancy lasts 280 days (40 weeks)
  var startDate = selectedDate;
  var endDate = selectedDate.add(const Duration(days: 280));
  var trimester1Start = startDate;
  var trimester1End = startDate.add(const Duration(days: 12 * 7));
  var trimester2Start = trimester1End;
  var trimester2End = trimester2Start.add(const Duration(days: 14 * 7));
  var trimester3Start = trimester2End;
  var trimester3End = endDate;
  return [
    trimester1Start,
    trimester1End,
    trimester2Start,
    trimester2End,
    trimester3Start,
    trimester3End
  ];
}
