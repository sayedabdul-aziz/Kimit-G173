class AppointmentService {
  Future<List<DateTime>> getAvailableAppointments(
      DateTime selectedDate, String start, String end) async {
    int startHour = int.parse(start);
    int endHour = int.parse(end);

//5
    List<DateTime> availableAppointments = [];
    for (int i = startHour; i < endHour; i++) {
      DateTime candidateTime =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day, i);

   // check if booking day is today (if today check if hour is greater than now)
      if (candidateTime.hour > DateTime.now().hour &&
          candidateTime.day == DateTime.now().day &&
          candidateTime.month == DateTime.now().month) {
        availableAppointments.add(candidateTime);
      }
      if (candidateTime.day != DateTime.now().day) {
        availableAppointments.add(candidateTime);
      }
    }

    return availableAppointments;
  }
}
