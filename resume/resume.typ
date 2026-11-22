// Public resume for joeyhershkop.com. Compile: typst compile resume/resume.typ public/resume.pdf
// No phone number and no private employer details: keep it that way.

#import "template.typ": *

#show: resume.with(
  name: "Joey Hershkop",
  contacts: (
    "Toronto, ON",
    "jhershkop@gmail.com",
    "github.com/JoeHershkie",
    "linkedin.com/in/jhershkop",
  ),
)

#section("Education")
#entry(
  org: "McGill University",
  location: "Montreal, QC",
  title: "Bachelor of Engineering, Computer Engineering",
  date: "June 2025",
  bullets: (
    [Engineering Class of 1969 Scholarship],
    [Antje Graupe Pryor International Award in Engineering],
    [Dean's Honour List],
  ),
)
#skill("Relevant Courses")[Artificial Intelligence, Data Structures & Algorithms, Discrete Mathematics, Operations Research]

#section("Work Experience")
#entry(
  org: "Thea",
  location: "Toronto, ON",
  title: "Founding Engineer",
  date: "October 2026 – Present",
  bullets: (
    [First engineering hire at an early-stage startup that places private residential mortgage deals in Ontario; own engineering end to end, working directly with the founders.],
  ),
)
#entry(
  org: "Elroy",
  location: "Toronto, ON",
  title: "Software Developer",
  date: "June 2025 – October 2026",
  bullets: (
    [Built and shipped production features for a B2B SaaS platform used by real clients, owning PostgreSQL schemas and migrations, REST APIs, React/TypeScript clients, and automated tests.],
    [Owned subscription billing and payment-webhook handling, access controls (role-based access, subscription-tier gating), and an auditable document-sharing workflow with end-to-end browser tests.],
    [Built internal tooling for LLM-assisted development, while keeping responsibility for architecture, tests, and correctness.],
  ),
)
#entry(
  org: "Unlimited Robotics",
  location: "Tel Aviv, IL",
  title: "Engineering Intern",
  date: "May 2022 – August 2022",
  bullets: (
    [Assembled and tested electrical and mechanical subsystems in a multipurpose humanoid robot.],
    [Produced SolidWorks models of lift-arm assembly and maintained inventory of 1000+ vendor and additively-manufactured parts.],
  ),
)

#section("Technical Projects")
#project("ParkKing — Toronto Curb Parking App (getparkking.com)", "Python, GeoPandas, Shapely, SQLite, Swift, SwiftUI, MapKit, Kotlin", bullets: (
  [Shipped a free iPhone app on the App Store that shows, for any curb in Toronto and any time of day, whether parking is allowed, using the City's parking bylaws; an Android version is in development.],
  [Built the Python data pipeline that parses ambiguous bylaw text, resolves it against the City's street network, and projects rules onto curb geometry, with provenance, failure codes, and regression tests. The current release ships about 82,000 curb features in a bundled SQLite database with a spatial index, so lookups work offline.],
  [Added ticket-derived signals from seven years of City ticket data: paid-curb labels, stop-zone sizing, and per-block ticket-risk estimates.],
))
#project("HoverBot — Vision-Based Navigation System", "Python, OpenCV, NumPy, threading", bullets: (
  [Authored a multithreaded computer-vision pipeline sustaining 30 fps with ≤ 100 ms image-to-actuation latency, tracking and navigating multiple robots simultaneously.],
  [Tuned controller to ± 3 cm mean arrival error across 30 way-points in a 6 m² arena.],
))

#section("Technical Skills & Interests")
#skill("Languages")[Python, TypeScript, JavaScript, SQL, Swift, Kotlin, PHP, Java, Bash, C/C++, HTML/CSS]
#skill("Backend & Data")[RESTful APIs, PostgreSQL, SQLite, Redis, Webhooks, Stripe, GeoJSON, ETL pipelines, domain modeling]
#skill("Frontend & Mobile")[React, TypeScript, SwiftUI, MapKit, Jetpack Compose, MapLibre]
#skill("Testing & Reliability")[pytest, Vitest, Playwright, PHPUnit, GitHub Actions, idempotency, failure triage]
#skill("Infrastructure & Tools")[Docker, Git, GitHub, Cloudflare, Oracle Cloud, SSH, LLM-assisted development]
#skill("Interests")[Maths, Making Music, Philosophy, Visual Art, Literature, Writing]
