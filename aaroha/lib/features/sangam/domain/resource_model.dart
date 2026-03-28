class RecoveryCenter {
  final String id;
  final String name;
  final String address;
  final String phone;
  final bool isOpen;
  final String type; // 'hospital' | 'ngo' | 'rehab'
  final double? lat;
  final double? lng;

  const RecoveryCenter({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.isOpen,
    required this.type,
    this.lat,
    this.lng,
  });

  String get statusLabel => isOpen ? 'Open now' : 'Closed';
}

class RecoveryEvent {
  final String id;
  final String title;
  final DateTime dateTime;
  final String mode; // 'online' | 'in-person'
  final bool isFree;
  final String? registrationUrl;

  const RecoveryEvent({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.mode,
    this.isFree = false,
    this.registrationUrl,
  });

  String get formattedDate {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${dateTime.day} ${months[dateTime.month]}';
  }

  String get formattedDay => '${dateTime.day}';
  String get formattedMonth {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return months[dateTime.month];
  }

  String get formattedTime {
    final h = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    final m = dateTime.minute.toString().padLeft(2, '0');
    final suffix = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $suffix';
  }

  String get modeLabel {
    if (mode == 'online') return isFree ? 'Online · Free' : 'Online';
    return 'In-person';
  }
}

/// Static seed data — replace with Google Places API in production
class ResourceRepository {
  static List<RecoveryCenter> get keralaCenters => [
    const RecoveryCenter(
      id: 'c001',
      name: 'Thrissur Wellness Center',
      address: 'Civil Lane Rd, Ayyanthole, Thrissur',
      phone: 'tel:04872334455',
      isOpen: true,
      type: 'hospital',
      lat: 10.5276,
      lng: 76.2144,
    ),
    const RecoveryCenter(
      id: 'c002',
      name: 'Asha Recovery Point',
      address: 'Shornur Rd, Patturaikkal, Thrissur',
      phone: 'tel:04872234411',
      isOpen: false,
      type: 'ngo',
      lat: 10.5281,
      lng: 76.2198,
    ),
    const RecoveryCenter(
      id: 'c003',
      name: 'Palakkad Care Hub',
      address: 'Fort Maidan, Palakkad, Kerala',
      phone: 'tel:04912525252',
      isOpen: true,
      type: 'rehab',
      lat: 10.7867,
      lng: 76.6548,
    ),
    const RecoveryCenter(
      id: 'c004',
      name: 'NIMHANS Outreach — Kochi',
      address: 'Ernakulam District, Kochi, Kerala',
      phone: 'tel:04842351040',
      isOpen: true,
      type: 'hospital',
      lat: 9.9312,
      lng: 76.2673,
    ),
  ];

  static List<RecoveryEvent> get upcomingEvents => [
    RecoveryEvent(
      id: 'e001',
      title: 'Breathwork 101 — Beginners',
      dateTime: DateTime.now().add(const Duration(days: 1))
          .copyWith(hour: 18, minute: 0),
      mode: 'online',
      isFree: true,
    ),
    RecoveryEvent(
      id: 'e002',
      title: 'AA Group Meeting — Thrissur',
      dateTime: DateTime.now().add(const Duration(days: 8))
          .copyWith(hour: 10, minute: 0),
      mode: 'in-person',
    ),
    RecoveryEvent(
      id: 'e003',
      title: 'Recovery Story Circle',
      dateTime: DateTime.now().add(const Duration(days: 15))
          .copyWith(hour: 19, minute: 0),
      mode: 'online',
      isFree: true,
    ),
  ];
}
