# EDU Foundation – Donor Tracking Database

A MySQL relational database for a fictional education charity, "EDU Youth Foundation".
It tracks donors, their contact details, donations, events, sponsorships, employees,
and donor–staff communication. Built for the *Database Design & Development*
course (BTEC A/618/7400) at Al Hussein Technical University, 2024–25.

## What's inside

| Area | Details |
|---|---|
| Tables (10) | `DONOR`, `DONOR_PHONE`, `DONOR_EMAIL`, `Department`, `Employee`, `Event`, `Sponsorship`, `Donation`, `EventParticipants`, `CommunicationTable` |
| Views (4) | `DonorDonationSummary`, `EventCoordinatorDetails`, `SponsorshipDetails`, `UpcomingEvents` |
| Stored procedures (6) | `AddDonor`, `UpdateDonorContact`, `AddEvent`, `RecordDonation`, `RegisterForEvent`, `SendMessageToEmployee` |
| Roles | `Donor_manager`, `Event_manager`, `Finance_manager`, `Donor` with least-privilege grants |
| Integrity | PK/FK with `ON DELETE/UPDATE CASCADE`, `CHECK` (amount > 0, email contains `@`), `UNIQUE`, `NOT NULL`, `DEFAULT` |

Relationships: multi-valued donor phones/emails (1:M), department → employees (1:M),
employee → events (1:M), event → sponsorships (1:M), donor → donations (1:M),
donors ↔ events (M:N via `EventParticipants`), donors ↔ employees (via `CommunicationTable`).

## Setup

Requires MySQL 8+.

```bash
mysql -u root -p < sql/01_schema.sql
mysql -u root -p < sql/02_views_procedures.sql
mysql -u root -p < sql/03_security.sql      # edit the passwords first!
mysql -u root -p < sql/04_sample_data.sql
```

`sql/05_tests.sql` contains example queries and privilege tests. It changes data, so run it
on a scratch database, ideally logged in as each role to check its permissions.

## Known limitations / ideas

- IDs are plain `INT` without `AUTO_INCREMENT`, so `AddDonor` (which omits `DonorID`) fails as written.
- Money columns use `DOUBLE`; `DECIMAL(10,2)` is safer.
- `CommunicationTable` has PK `(DonorID, EmployeeID)`, so only one logged contact per pair.
- Sample data is fictional.
