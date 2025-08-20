String extractMissionName(String notificationTitle) {
  // Remove "Mission " prefix if it exists
  var result = notificationTitle.replaceFirst(RegExp(r'^Mission\s+'), '');

  // Remove " completed" suffix if it exists
  result = result.replaceFirst(RegExp(r'\s+completed$'), '');

  return result.trim();
}
