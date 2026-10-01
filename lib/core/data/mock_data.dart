import 'package:flutter/material.dart';

/// Mock data repository for MyCampus UI showcase.
/// Provides structured data for all feature modules.
class MockData {
  MockData._();

  // ── User Data ────────────────────────────────────────────────────

  static const Map<String, dynamic> studentUser = {
    'id': 'STU-2024-0042',
    'name': 'Rahul Ahmed',
    'email': 'rahul.ahmed@mycampus.edu',
    'phone': '+880 1712-345678',
    'role': 'Student',
    'department': 'Computer Science & Engineering',
    'semester': '6th Semester',
    'section': 'A',
    'batch': '2021-2025',
    'studentId': 'CSE-21042',
    'gpa': 3.72,
    'avatar': 'https://i.pravatar.cc/150?img=11',
  };

  static const Map<String, dynamic> teacherUser = {
    'id': 'TCH-2024-0008',
    'name': 'Dr. Fatima Rahman',
    'email': 'fatima.rahman@mycampus.edu',
    'phone': '+880 1912-876543',
    'role': 'Teacher',
    'department': 'Computer Science & Engineering',
    'designation': 'Associate Professor',
    'specialization': 'Artificial Intelligence & ML',
    'employeeId': 'FAC-0812',
    'avatar': 'https://i.pravatar.cc/150?img=32',
  };

  // ── Notices ──────────────────────────────────────────────────────

  static final List<Map<String, dynamic>> notices = [
    {
      'id': 1,
      'title': 'Mid-Semester Examination Schedule Published',
      'description':
          'The mid-semester examination for all departments will commence from October 15, 2026. Students are advised to collect their admit cards from the exam section before October 10.\n\nImportant points:\n• Bring your student ID card to every exam\n• Arrive at least 15 minutes before the exam\n• Electronic devices are strictly prohibited\n• Seat plan will be published 2 days before exams',
      'category': 'Exam',
      'date': '2026-09-25',
      'author': 'Examination Cell',
      'isNew': true,
    },
    {
      'id': 2,
      'title': 'Annual Tech Fest "InnoVerse 2026" Registrations Open',
      'description':
          'We are thrilled to announce InnoVerse 2026 — the biggest tech festival of the year! Join us for hackathons, coding competitions, robotics challenges, and inspiring talks from industry leaders.\n\nEvent Highlights:\n• 48-hour Hackathon with prizes worth ৳5,00,000\n• AI/ML Workshop by Google Engineers\n• Startup Pitch Competition\n• Cultural Night with celebrity performance\n\nRegistration deadline: October 5, 2026',
      'category': 'Event',
      'date': '2026-09-24',
      'author': 'Student Affairs',
      'isNew': true,
    },
    {
      'id': 3,
      'title': 'Library Extended Hours During Exam Season',
      'description':
          'The central library will remain open from 8:00 AM to 11:00 PM during the examination period (Oct 10 – Nov 5). Group study rooms can be booked through the MyCampus app.\n\nNew Resources Available:\n• 200+ new reference books added\n• IEEE Xplore access renewed\n• Silent study zone on 3rd floor',
      'category': 'Academic',
      'date': '2026-09-23',
      'author': 'Library Committee',
      'isNew': false,
    },
    {
      'id': 4,
      'title': 'Campus Wi-Fi Maintenance — Service Disruption',
      'description':
          'The campus-wide Wi-Fi network will undergo scheduled maintenance on September 30, from 2:00 AM to 6:00 AM. All internet services including the campus portal will be temporarily unavailable.\n\nAffected areas: All academic buildings, hostels, and cafeteria.\nAlternative: Mobile data backup will be provided for hostel students.',
      'category': 'Urgent',
      'date': '2026-09-22',
      'author': 'IT Department',
      'isNew': false,
    },
    {
      'id': 5,
      'title': 'New Course Registration Window Opens',
      'description':
          'Course registration for the Spring 2027 semester will open on October 20. Students must complete registration within the allotted time to avoid late fees.\n\nSteps:\n1. Check prerequisite clearance\n2. Meet with your academic advisor\n3. Register through the portal\n4. Pay semester fees',
      'category': 'Academic',
      'date': '2026-09-20',
      'author': 'Registrar Office',
      'isNew': false,
    },
  ];

  // ── Attendance ───────────────────────────────────────────────────

  static final List<Map<String, dynamic>> attendance = [
    {
      'subject': 'Data Structures & Algorithms',
      'code': 'CSE-301',
      'totalClasses': 32,
      'attended': 28,
      'percentage': 87.5,
      'color': Color(0xFF3B82F6),
    },
    {
      'subject': 'Database Management System',
      'code': 'CSE-303',
      'totalClasses': 28,
      'attended': 25,
      'percentage': 89.3,
      'color': Color(0xFF22C55E),
    },
    {
      'subject': 'Computer Networks',
      'code': 'CSE-305',
      'totalClasses': 30,
      'attended': 22,
      'percentage': 73.3,
      'color': Color(0xFFF59E0B),
    },
    {
      'subject': 'Operating Systems',
      'code': 'CSE-307',
      'totalClasses': 26,
      'attended': 24,
      'percentage': 92.3,
      'color': Color(0xFF8B5CF6),
    },
    {
      'subject': 'Software Engineering',
      'code': 'CSE-309',
      'totalClasses': 24,
      'attended': 16,
      'percentage': 66.7,
      'color': Color(0xFFEF4444),
    },
    {
      'subject': 'Discrete Mathematics',
      'code': 'MTH-201',
      'totalClasses': 30,
      'attended': 27,
      'percentage': 90.0,
      'color': Color(0xFF06B6D4),
    },
  ];

  // Attendance calendar data for the current month (Sep 2026)
  static final Map<int, String> attendanceCalendar = {
    1: 'present',
    2: 'present',
    3: 'present',
    4: 'absent',
    5: 'weekend',
    6: 'weekend',
    7: 'present',
    8: 'present',
    9: 'late',
    10: 'present',
    11: 'present',
    12: 'weekend',
    13: 'weekend',
    14: 'present',
    15: 'absent',
    16: 'present',
    17: 'present',
    18: 'present',
    19: 'weekend',
    20: 'weekend',
    21: 'present',
    22: 'present',
    23: 'present',
    24: 'present',
    25: 'present',
    26: 'weekend',
    27: 'weekend',
  };

  // ── Dashboard Quick Access ───────────────────────────────────────

  static final List<Map<String, dynamic>> quickAccessItems = [
    {
      'title': 'Notices',
      'icon': Icons.campaign_outlined,
      'color': Color(0xFF3B82F6),
      'route': '/notices',
    },
    {
      'title': 'Attendance',
      'icon': Icons.fact_check_outlined,
      'color': Color(0xFF22C55E),
      'route': '/attendance',
    },
    {
      'title': 'Results',
      'icon': Icons.assessment_outlined,
      'color': Color(0xFF8B5CF6),
      'route': '/results',
    },
    {
      'title': 'Routine',
      'icon': Icons.calendar_today_outlined,
      'color': Color(0xFFF59E0B),
      'route': '/routine',
    },
    {
      'title': 'Assignments',
      'icon': Icons.assignment_outlined,
      'color': Color(0xFFEF4444),
      'route': '/assignments',
    },
    {
      'title': 'Events',
      'icon': Icons.celebration_outlined,
      'color': Color(0xFFEC4899),
      'route': '/events',
    },
    {
      'title': 'Library',
      'icon': Icons.local_library_outlined,
      'color': Color(0xFF06B6D4),
      'route': '/library',
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline_rounded,
      'color': Color(0xFF64748B),
      'route': '/profile',
    },
  ];

  // ── Today at a Glance ────────────────────────────────────────────

  static const Map<String, dynamic> todayGlance = {
    'nextClass': {
      'subject': 'Data Structures & Algorithms',
      'time': '10:30 AM',
      'room': 'Room 301, Building A',
      'teacher': 'Dr. Kamal Hossain',
    },
    'pendingAssignment': {
      'title': 'Binary Tree Implementation',
      'subject': 'DSA',
      'dueDate': 'Oct 2, 2026',
      'daysLeft': 5,
    },
    'latestNotice': {
      'title': 'Mid-Semester Exam Schedule Published',
      'category': 'Exam',
    },
  };

  // ── Results & Grades ──────────────────────────────────────────────

  static const Map<String, dynamic> resultsOverview = {
    'cgpa': 3.72,
    'totalCredits': 102,
    'completedSemesters': 5,
    'rank': 8,
    'totalStudents': 120,
  };

  static final List<Map<String, dynamic>> semesterResults = [
    {
      'semester': '5th Semester',
      'session': 'Spring 2026',
      'gpa': 3.85,
      'credits': 18,
      'courses': [
        {'name': 'Data Structures & Algorithms', 'code': 'CSE-301', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Database Management System', 'code': 'CSE-303', 'credits': 3, 'grade': 'A-', 'point': 3.70},
        {'name': 'Computer Networks', 'code': 'CSE-305', 'credits': 3, 'grade': 'B+', 'point': 3.30},
        {'name': 'Operating Systems', 'code': 'CSE-307', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Software Engineering', 'code': 'CSE-309', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Discrete Mathematics', 'code': 'MTH-201', 'credits': 3, 'grade': 'A-', 'point': 3.70},
      ],
    },
    {
      'semester': '4th Semester',
      'session': 'Fall 2025',
      'gpa': 3.68,
      'credits': 21,
      'courses': [
        {'name': 'Object Oriented Programming', 'code': 'CSE-201', 'credits': 3, 'grade': 'A-', 'point': 3.70},
        {'name': 'Digital Logic Design', 'code': 'CSE-203', 'credits': 3, 'grade': 'B+', 'point': 3.30},
        {'name': 'Probability & Statistics', 'code': 'MTH-103', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Electronics I', 'code': 'EEE-201', 'credits': 3, 'grade': 'B+', 'point': 3.30},
        {'name': 'Technical Writing', 'code': 'ENG-201', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Data Communication', 'code': 'CSE-205', 'credits': 3, 'grade': 'A-', 'point': 3.70},
        {'name': 'OOP Lab', 'code': 'CSE-202', 'credits': 3, 'grade': 'A', 'point': 4.00},
      ],
    },
    {
      'semester': '3rd Semester',
      'session': 'Spring 2025',
      'gpa': 3.62,
      'credits': 21,
      'courses': [
        {'name': 'Data Structures', 'code': 'CSE-101', 'credits': 3, 'grade': 'A-', 'point': 3.70},
        {'name': 'Calculus II', 'code': 'MTH-102', 'credits': 3, 'grade': 'B+', 'point': 3.30},
        {'name': 'Physics II', 'code': 'PHY-102', 'credits': 3, 'grade': 'B+', 'point': 3.30},
        {'name': 'Linear Algebra', 'code': 'MTH-104', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'Electrical Circuits', 'code': 'EEE-101', 'credits': 3, 'grade': 'B', 'point': 3.00},
        {'name': 'English Composition', 'code': 'ENG-102', 'credits': 3, 'grade': 'A', 'point': 4.00},
        {'name': 'DS Lab', 'code': 'CSE-102', 'credits': 3, 'grade': 'A', 'point': 4.00},
      ],
    },
  ];

  // ── Class Routine ────────────────────────────────────────────────

  static final List<String> weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'];

  static final Map<String, List<Map<String, dynamic>>> weeklyRoutine = {
    'Sun': [
      {'subject': 'Data Structures & Algorithms', 'code': 'CSE-301', 'time': '08:30 – 09:45', 'room': 'Room 301, Bldg A', 'teacher': 'Dr. Kamal Hossain', 'type': 'Lecture', 'color': Color(0xFF3B82F6)},
      {'subject': 'Computer Networks', 'code': 'CSE-305', 'time': '10:00 – 11:15', 'room': 'Room 405, Bldg B', 'teacher': 'Prof. Nusrat Jahan', 'type': 'Lecture', 'color': Color(0xFFF59E0B)},
      {'subject': 'DSA Lab', 'code': 'CSE-302', 'time': '11:30 – 01:00', 'room': 'Lab 3, Bldg C', 'teacher': 'Dr. Kamal Hossain', 'type': 'Lab', 'color': Color(0xFF22C55E)},
    ],
    'Mon': [
      {'subject': 'Database Management System', 'code': 'CSE-303', 'time': '08:30 – 09:45', 'room': 'Room 202, Bldg A', 'teacher': 'Dr. Fatima Rahman', 'type': 'Lecture', 'color': Color(0xFF22C55E)},
      {'subject': 'Operating Systems', 'code': 'CSE-307', 'time': '10:00 – 11:15', 'room': 'Room 301, Bldg A', 'teacher': 'Dr. Arif Hasan', 'type': 'Lecture', 'color': Color(0xFF8B5CF6)},
      {'subject': 'Software Engineering', 'code': 'CSE-309', 'time': '02:00 – 03:15', 'room': 'Room 105, Bldg B', 'teacher': 'Prof. Tanvir Islam', 'type': 'Lecture', 'color': Color(0xFFEF4444)},
    ],
    'Tue': [
      {'subject': 'Data Structures & Algorithms', 'code': 'CSE-301', 'time': '08:30 – 09:45', 'room': 'Room 301, Bldg A', 'teacher': 'Dr. Kamal Hossain', 'type': 'Lecture', 'color': Color(0xFF3B82F6)},
      {'subject': 'Discrete Mathematics', 'code': 'MTH-201', 'time': '10:00 – 11:15', 'room': 'Room 108, Bldg A', 'teacher': 'Prof. Rina Akter', 'type': 'Lecture', 'color': Color(0xFF06B6D4)},
      {'subject': 'DBMS Lab', 'code': 'CSE-304', 'time': '11:30 – 01:00', 'room': 'Lab 2, Bldg C', 'teacher': 'Dr. Fatima Rahman', 'type': 'Lab', 'color': Color(0xFFEC4899)},
    ],
    'Wed': [
      {'subject': 'Computer Networks', 'code': 'CSE-305', 'time': '08:30 – 09:45', 'room': 'Room 405, Bldg B', 'teacher': 'Prof. Nusrat Jahan', 'type': 'Lecture', 'color': Color(0xFFF59E0B)},
      {'subject': 'Operating Systems', 'code': 'CSE-307', 'time': '10:00 – 11:15', 'room': 'Room 301, Bldg A', 'teacher': 'Dr. Arif Hasan', 'type': 'Lecture', 'color': Color(0xFF8B5CF6)},
      {'subject': 'CN Lab', 'code': 'CSE-306', 'time': '02:00 – 03:30', 'room': 'Lab 1, Bldg C', 'teacher': 'Prof. Nusrat Jahan', 'type': 'Lab', 'color': Color(0xFF64748B)},
    ],
    'Thu': [
      {'subject': 'Database Management System', 'code': 'CSE-303', 'time': '08:30 – 09:45', 'room': 'Room 202, Bldg A', 'teacher': 'Dr. Fatima Rahman', 'type': 'Lecture', 'color': Color(0xFF22C55E)},
      {'subject': 'Software Engineering', 'code': 'CSE-309', 'time': '10:00 – 11:15', 'room': 'Room 105, Bldg B', 'teacher': 'Prof. Tanvir Islam', 'type': 'Lecture', 'color': Color(0xFFEF4444)},
      {'subject': 'Discrete Mathematics', 'code': 'MTH-201', 'time': '11:30 – 12:45', 'room': 'Room 108, Bldg A', 'teacher': 'Prof. Rina Akter', 'type': 'Lecture', 'color': Color(0xFF06B6D4)},
    ],
  };

  // ── Assignments ──────────────────────────────────────────────────

  static final List<Map<String, dynamic>> assignments = [
    {
      'title': 'Binary Tree Implementation',
      'subject': 'Data Structures & Algorithms',
      'code': 'CSE-301',
      'dueDate': '2026-10-02',
      'status': 'pending',
      'description': 'Implement a binary search tree with insert, delete, and traversal operations in C++.',
      'marks': 20,
      'color': Color(0xFF3B82F6),
    },
    {
      'title': 'ER Diagram — Hospital Management',
      'subject': 'Database Management System',
      'code': 'CSE-303',
      'dueDate': '2026-10-05',
      'status': 'pending',
      'description': 'Design a complete ER diagram for a hospital management system with at least 8 entities.',
      'marks': 15,
      'color': Color(0xFF22C55E),
    },
    {
      'title': 'Socket Programming Chat App',
      'subject': 'Computer Networks',
      'code': 'CSE-305',
      'dueDate': '2026-10-08',
      'status': 'pending',
      'description': 'Build a multi-client chat application using TCP socket programming in Python.',
      'marks': 25,
      'color': Color(0xFFF59E0B),
    },
    {
      'title': 'Process Scheduling Simulation',
      'subject': 'Operating Systems',
      'code': 'CSE-307',
      'dueDate': '2026-09-28',
      'status': 'submitted',
      'description': 'Simulate FCFS, SJF, and Round Robin scheduling algorithms.',
      'marks': 20,
      'obtainedMarks': 18,
      'color': Color(0xFF8B5CF6),
    },
    {
      'title': 'SRS Document — E-Commerce',
      'subject': 'Software Engineering',
      'code': 'CSE-309',
      'dueDate': '2026-09-25',
      'status': 'graded',
      'description': 'Prepare a Software Requirements Specification for an e-commerce platform.',
      'marks': 30,
      'obtainedMarks': 27,
      'color': Color(0xFFEF4444),
    },
    {
      'title': 'Graph Theory Problem Set',
      'subject': 'Discrete Mathematics',
      'code': 'MTH-201',
      'dueDate': '2026-09-20',
      'status': 'graded',
      'description': 'Solve all problems from Chapter 8 — Graph Theory and Combinatorics.',
      'marks': 15,
      'obtainedMarks': 13,
      'color': Color(0xFF06B6D4),
    },
  ];

  // ── Campus Events ────────────────────────────────────────────────

  static final List<Map<String, dynamic>> events = [
    {
      'title': 'InnoVerse 2026 — Tech Fest',
      'description': 'The biggest tech festival of the year featuring hackathons, coding competitions, robotics challenges, and inspiring talks from industry leaders.',
      'date': '2026-10-15',
      'time': '9:00 AM – 6:00 PM',
      'venue': 'Main Auditorium & Campus Grounds',
      'organizer': 'Student Affairs',
      'category': 'Tech',
      'isRegistered': true,
      'color': Color(0xFF3B82F6),
      'icon': Icons.code_rounded,
    },
    {
      'title': 'AI/ML Workshop by Google',
      'description': 'A hands-on workshop on machine learning fundamentals, TensorFlow basics, and deploying ML models. Bring your laptop!',
      'date': '2026-10-10',
      'time': '10:00 AM – 2:00 PM',
      'venue': 'Seminar Hall, Building B',
      'organizer': 'CSE Department',
      'category': 'Workshop',
      'isRegistered': false,
      'color': Color(0xFF22C55E),
      'icon': Icons.psychology_rounded,
    },
    {
      'title': 'Inter-Department Cricket Tournament',
      'description': 'Annual cricket tournament between all departments. Come cheer for your department team!',
      'date': '2026-10-18',
      'time': '3:00 PM – 7:00 PM',
      'venue': 'Campus Cricket Ground',
      'organizer': 'Sports Committee',
      'category': 'Sports',
      'isRegistered': true,
      'color': Color(0xFFF59E0B),
      'icon': Icons.sports_cricket_rounded,
    },
    {
      'title': 'Cultural Night 2026',
      'description': 'An evening of music, dance, drama, and poetry. Special guest performance by renowned artists.',
      'date': '2026-10-22',
      'time': '5:00 PM – 10:00 PM',
      'venue': 'Open Air Theater',
      'organizer': 'Cultural Club',
      'category': 'Cultural',
      'isRegistered': false,
      'color': Color(0xFFEC4899),
      'icon': Icons.music_note_rounded,
    },
    {
      'title': 'Startup Pitch Competition',
      'description': 'Present your startup idea to a panel of investors and industry mentors. Top 3 teams win seed funding!',
      'date': '2026-10-25',
      'time': '11:00 AM – 4:00 PM',
      'venue': 'Conference Room, Admin Building',
      'organizer': 'Entrepreneurship Cell',
      'category': 'Business',
      'isRegistered': false,
      'color': Color(0xFF8B5CF6),
      'icon': Icons.rocket_launch_rounded,
    },
    {
      'title': 'Blood Donation Camp',
      'description': 'Annual blood donation drive in collaboration with the Red Crescent Society. Every drop counts!',
      'date': '2026-10-28',
      'time': '9:00 AM – 3:00 PM',
      'venue': 'Medical Center',
      'organizer': 'Social Service Club',
      'category': 'Social',
      'isRegistered': true,
      'color': Color(0xFFEF4444),
      'icon': Icons.volunteer_activism_rounded,
    },
  ];

  // ── Digital Library ──────────────────────────────────────────────

  static final List<String> libraryCategories = [
    'All',
    'CSE',
    'Mathematics',
    'Physics',
    'English',
    'EEE',
  ];

  static final List<Map<String, dynamic>> libraryBooks = [
    {
      'title': 'Introduction to Algorithms',
      'author': 'Thomas H. Cormen',
      'category': 'CSE',
      'edition': '4th Edition',
      'available': true,
      'copies': 5,
      'totalCopies': 8,
      'isbn': '978-0-262-04630-5',
      'color': Color(0xFF3B82F6),
    },
    {
      'title': 'Database System Concepts',
      'author': 'Abraham Silberschatz',
      'category': 'CSE',
      'edition': '7th Edition',
      'available': true,
      'copies': 3,
      'totalCopies': 6,
      'isbn': '978-0-078-02215-9',
      'color': Color(0xFF22C55E),
    },
    {
      'title': 'Computer Networking: A Top-Down Approach',
      'author': 'James F. Kurose',
      'category': 'CSE',
      'edition': '8th Edition',
      'available': false,
      'copies': 0,
      'totalCopies': 4,
      'isbn': '978-0-135-92864-4',
      'color': Color(0xFFF59E0B),
    },
    {
      'title': 'Calculus: Early Transcendentals',
      'author': 'James Stewart',
      'category': 'Mathematics',
      'edition': '9th Edition',
      'available': true,
      'copies': 7,
      'totalCopies': 10,
      'isbn': '978-1-337-61392-7',
      'color': Color(0xFF8B5CF6),
    },
    {
      'title': 'Linear Algebra and Its Applications',
      'author': 'David C. Lay',
      'category': 'Mathematics',
      'edition': '6th Edition',
      'available': true,
      'copies': 4,
      'totalCopies': 6,
      'isbn': '978-0-135-85102-0',
      'color': Color(0xFF06B6D4),
    },
    {
      'title': 'University Physics',
      'author': 'Hugh D. Young',
      'category': 'Physics',
      'edition': '15th Edition',
      'available': true,
      'copies': 6,
      'totalCopies': 8,
      'isbn': '978-0-135-15989-5',
      'color': Color(0xFFEF4444),
    },
    {
      'title': 'Operating System Concepts',
      'author': 'Abraham Silberschatz',
      'category': 'CSE',
      'edition': '10th Edition',
      'available': true,
      'copies': 2,
      'totalCopies': 5,
      'isbn': '978-1-119-80052-0',
      'color': Color(0xFFEC4899),
    },
    {
      'title': 'Fundamentals of Electric Circuits',
      'author': 'Charles K. Alexander',
      'category': 'EEE',
      'edition': '7th Edition',
      'available': false,
      'copies': 0,
      'totalCopies': 4,
      'isbn': '978-0-078-02822-9',
      'color': Color(0xFF64748B),
    },
  ];

  static final List<Map<String, dynamic>> borrowedBooks = [
    {
      'title': 'Introduction to Algorithms',
      'author': 'Thomas H. Cormen',
      'borrowDate': '2026-09-15',
      'dueDate': '2026-10-15',
      'isOverdue': false,
      'color': Color(0xFF3B82F6),
    },
    {
      'title': 'Calculus: Early Transcendentals',
      'author': 'James Stewart',
      'borrowDate': '2026-09-01',
      'dueDate': '2026-10-01',
      'isOverdue': true,
      'color': Color(0xFF8B5CF6),
    },
  ];
}

