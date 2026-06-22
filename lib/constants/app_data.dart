class AppData {
  static const String name         = 'Seyadu Babu Ali';
  static const String title        = 'Senior Engineer / Tech Lead';
  static const String subtitle     = '9.6+ Years of Experience';
  static const String bio          =
      'Passionate mobile engineer specializing in Flutter and Android, '
      'delivering high-impact applications for global brands. Expert in '
      'scalable architecture, performance optimization, and leading '
      'cross-functional teams to ship business-critical features.';

  static const String email        = 'babu.soft076@email.com';
  static const String github       = 'https://github.com/seyadubabu';
  static const String linkedIn     = 'https://www.linkedin.com/in/seyadubabuali';
  static const String resumeUrl    = 'assets/resume/Seyadubabuali_flutter_android_9_years_Resume.pdf';
  static const String profileImage = 'assets/images/profile.jpg';

  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter',                  'level': 0.95},
    {'name': 'Android (Kotlin / Java)',  'level': 0.92},
    {'name': 'Dart',                     'level': 0.95},
    {'name': 'MVVM / Clean Architecture',       'level': 0.90},
    {'name': 'BLoC / Riverpod / Provider',          'level': 0.88},
    {'name': 'Firebase',                 'level': 0.85},
    {'name': 'REST APIs / GraphQL',      'level': 0.85},
    {'name': 'CI/CD (GitHub Actions)',   'level': 0.80},
    {'name': 'Performance Optimization', 'level': 0.90},
    {'name': 'Unit & Widget Testing',    'level': 0.82},
  ];

  static const List<Map<String, dynamic>> experience = [
    {
      'company': 'Altimetrik',
      'role':    'Senior Engineer',
      'period':  'Oct 2023 – Jan 2026',
      'bullets': [
        'Led end‑to‑end development of new Flutter modules improving workflow performance by ~30% using rendering and API optimization.',
        'Implemented scalable navigation using Navigator 2.0 reducing code duplication and improving feature delivery timelines.',
        'Strengthened app reliability with Crashlytics monitoring achieving 99%+ crash‑free sessions.',
        'Collaborated with design, backend, and QA teams to deliver enterprise‑grade mobile solutions.',
      ],
    },
    {
      'company': 'eNoah iSolution',
      'role':    'Associate Consultant',
      'period':  'Aug 2021 – July 2023',
      'bullets': [
        'Built and maintained healthcare modules serving 500K+ active users across Android and iOS.',
        'Reduced crash rate by 22% through optimized memory handling, defensive coding, and structured logging.',
        'Led UI modernization initiative improving low‑end device performance by 18%.',
        'Mentored junior engineers and reviewed architecture proposals for new modules.',
      ],
    },
    {
      'company': 'RLabs Enterprise Services',
      'role':    'Senior Software Engineer',
      'period':  'Feb 2021 – July 2021',
      'bullets': [
        'Developed reusable UI components and scalable state‑management patterns for multi‑app ecosystems.',
        'Improved API response handling with caching and concurrency best practices.',
      ],
    },
    {
      'company': '10Decoders Consultancy Services',
      'role':    'Senior Developer',
      'period':  'Apr 2018 – Dec 2020',
      'bullets': [
        'Built multiple Flutter and Android apps from ground up including BLE‑enabled IoT solutions.',
        'Improved API processing efficiency by 40% using coroutine‑based parallel pipelines.',
        'Implemented CI/CD automation reducing app release cycle from 2 days to under 4 hours.',
      ],
    },
    {
      'company': 'Benchmark Business Software',
      'role':    'Software Developer',
      'period':  'Mar 2016 – Mar 2018',
      'bullets': [
        'Delivered 2+ Android apps with modern UI, efficient networking, and optimized storage handling.',
        'Refactored legacy codebases improving performance, stability, and maintainability.',
      ],
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'title':       'Samsung Shop',
      'description': 'The Samsung Shop App is the official digital storefront for purchasing Samsung devices, appliances, and tech accessories. It provides a streamlined, personalized shopping experience with exclusive deals, live order tracking, and seamless integration with your Samsung Account.',
      'metrics':     '10M+ users · Crash rate reduced 40% · 4.4★ rating',
      'tech':        ['Flutter', 'BLoC', 'Firebase', 'REST API', 'Sqflite'],
      'image':       'assets/images/projects/shop_app.png',
      'playStore':   'https://play.google.com/store/apps/details?id=com.samsung.ecomm.global.in&hl=en_IN',
      'appStore':    'https://apps.apple.com/in/app/samsung-shop/id1669155846',
      //'github':      'https://github.com/you/project1',
    },
    {
      'title':       'AVIS',
      'description': 'Discover a better rental car experience with the new Avis app. With 5,000+ locations in 165 countries, we are one of the worlds best-known car rental companies. Whether travelling for business, driving vacations across Australia or a weekend getaway, we know you want to get on the road as quickly as possible. The Avis app makes renting a car simple, speedy, and hassle-free with control of your journey from start to finish in the palm of your hands.',
      'metrics':     '10L+ downloads · 60fps render · 98% crash-free',
      'tech':        ['Flutter', 'Riverpod', 'REST API', 'Hive'],
      'image':       'assets/images/projects/avis.png',
      'playStore':   'https://play.google.com/store/apps/details?id=com.avis.androidapp&hl=en_IN',
      'appStore':    'https://apps.apple.com/in/app/avis-india/id6657986503',
      //'github':      'https://github.com/you/project2',
    },
    {
      'title':       'Budget',
      'description': 'Planning your next getaway or seeking an epic road trip? Quickly book a car with the all New Budget Car Rental app; it is like having your own personal mobile travel buddy. Sign up for Fastbreak to access features that will make your car rental experience easier. As a Fastbreak member, you can skip the line, make quick returns, manage your rental and customize your account all through the Budget app.',
      'metrics':     '10L+ users · Offline-first · 35% APK size reduction',
      'tech':        ['Android', 'Kotlin', 'MVVM', 'Room DB'],
      'image':       'assets/images/projects/budget.png',
      'playStore':   'https://play.google.com/store/apps/details?id=com.budget.androidapp&hl=en_IN',
      'appStore':    'https://apps.apple.com/us/app/budget-car-rental/id538787758',
      //'github':      'https://github.com/you/project3',
    },
  ];
}