-- NOTE: replace 'change_me' with strong passwords before using anywhere real.
-- Run as a privileged user (e.g. root) after 01 and 02.
CREATE USER 'Donor_manager' IDENTIFIED BY 'change_me';
CREATE USER 'Event_manager' IDENTIFIED BY 'change_me';
CREATE USER 'Finance_manager' IDENTIFIED BY 'change_me';
CREATE USER 'Donor' IDENTIFIED BY 'change_me';


GRANT SELECT, INSERT, UPDATE, DELETE ON EDU_FOUNDATION.DONOR TO 'Donor_manager';
GRANT SELECT ON EDU_FOUNDATION.Donation TO 'Donor_manager';
GRANT SELECT, INSERT ON EDU_FOUNDATION.CommunicationTable TO 'Donor_manager';
-- View and Procedures Priviliges --
GRANT SELECT ON EDU_FOUNDATION.DonorDonationSummary TO 'Donor_manager';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.AddDonor TO 'Donor_manager';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.UpdateDonorContact TO 'Donor_manager';

GRANT SELECT, INSERT, UPDATE, DELETE ON EDU_FOUNDATION.Event TO 'Event_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON EDU_FOUNDATION.EventParticipants TO 'Event_manager';
-- View and Procedures Priviliges --
GRANT SELECT ON EDU_FOUNDATION.EventCoordinatorDetails TO 'Event_manager';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.AddEvent TO 'Event_manager';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.RegisterForEvent TO 'Event_manager';

GRANT SELECT, INSERT, UPDATE, DELETE ON EDU_FOUNDATION.Donation TO 'Finance_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON EDU_FOUNDATION.Sponsorship TO 'Finance_manager';
-- View and Procedures Priviliges --
GRANT SELECT ON EDU_FOUNDATION.SponsorshipDetails TO 'Finance_manager';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.RecordDonation TO 'Finance_manager';

GRANT SELECT ON EDU_FOUNDATION.DONOR TO 'Donor';
GRANT SELECT ON EDU_FOUNDATION.DONOR_PHONE TO 'Donor';
GRANT SELECT ON EDU_FOUNDATION.DONOR_EMAIL TO 'Donor';
GRANT SELECT ON EDU_FOUNDATION.Event TO 'Donor';
GRANT SELECT ON EDU_FOUNDATION.Employee TO 'Donor';
GRANT SELECT ON EDU_FOUNDATION.Department TO 'Donor';
-- View and Procedures Priviliges --
GRANT SELECT ON EDU_FOUNDATION.UpcomingEvents TO 'Donor';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.RegisterForEvent TO 'Donor';
GRANT EXECUTE ON PROCEDURE EDU_FOUNDATION.SendMessageToEmployee TO 'Donor';
