-- =============================================
-- Products and Partnership Management Database
-- Supabase (PostgreSQL) Initialization Script
-- =============================================

-- Drop tables if exist (in correct order due to dependencies)
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS partners CASCADE;
DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

-- =============================================
-- CREATE TABLES
-- =============================================

-- Categories Table
CREATE TABLE categories (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    color TEXT
);

-- Roles Table
CREATE TABLE roles (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    color TEXT,
    description TEXT
);

-- Members Table
CREATE TABLE members (
    id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    company TEXT,
    department TEXT,
    title TEXT,
    location TEXT,
    roles TEXT[],
    skills TEXT[],
    notes TEXT
);

-- Partners Table
CREATE TABLE partners (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    categories TEXT[],
    location JSONB,
    contact JSONB,
    scope TEXT,
    agreement_type TEXT,
    agreement_doc TEXT,
    agreement_purpose TEXT,
    contract_value NUMERIC,
    liabilities TEXT,
    effective_date TEXT,
    expiry_date TEXT,
    notes TEXT,
    agreement JSONB,
    agreement_period NUMERIC
);

-- Projects Table
CREATE TABLE projects (
    id TEXT PRIMARY KEY,
    partner_id TEXT REFERENCES partners(id),
    name TEXT NOT NULL,
    scope TEXT,
    expectation TEXT,
    start_time TEXT,
    end_time TEXT,
    cost NUMERIC DEFAULT 0,
    progress INTEGER DEFAULT 0,
    phase TEXT,
    team_members JSONB,
    kpis JSONB,
    market_status TEXT,
    profitability_status TEXT,
    scalability_status TEXT,
    resource_status TEXT,
    technology_status TEXT,
    budget_status TEXT,
    risk_status TEXT,
    schedule_status TEXT
);

-- =============================================
-- INSERT DATA
-- =============================================

-- Insert Categories
INSERT INTO categories (id, name, color) VALUES
('technology', 'Technology', '#3b82f6'),
('marketing', 'Marketing Arm', '#ec4899'),
('finance', 'Product Owner', '#10b981'),
('operations', 'Operations', '#f59e0b'),
('strategy', 'Strategy', '#8b5cf6'),
('academic', 'Academic', '#06b6d4'),
('governance', 'Governance', '#84cc16'),
('customer', 'Customer', '#f43f5e'),
('cat_1766108849075', 'Contractor', '#d0b268');

-- Insert Roles
INSERT INTO roles (id, name, color, description) VALUES
('analyst', 'Business Analyst', '#8b5cf6', 'Analyzes business requirements'),
('consultant', 'Consultant', '#14b8a6', 'Provides expert consultation'),
('role_1766371380234', 'Data Engineer', '#88abce', 'Data Engineer'),
('role_1766371339835', 'Data Science', '#030a8a', 'Data Science'),
('designer', 'Designer', '#ec4899', 'Creates UI/UX designs'),
('developer', 'Developer', '#0891b2', 'Develops technical solutions'),
('role_1768181992317', 'DevOps', '#f599da', 'CI/CD DevOps'),
('role_1766371538643', 'IT Service', '#865dd7', 'IT Service'),
('role_1766371561674', 'OT Service', '#4e5fac', 'OT Service'),
('coordinator', 'Project Coordinator', '#a855f7', 'Coordinates project activities'),
('project_manager', 'Project Manager', '#7c3aed', 'Leads and manages project execution'),
('tester', 'QA Tester', '#f59e0b', 'Tests and ensures quality'),
('architect', 'Solution Architect', '#6366f1', 'Designs system architecture'),
('solution_owner', 'Solution Owner', '#ea580c', 'Owns the solution design and requirements'),
('role_1768180953222', 'Solution Owner - Advanced Analytics', '#3a460e', 'Advanced Analytics Solution Expert Domain'),
('role_1768180942042', 'Solution Owner - CT', '#b7023c', 'Culture Transfromation Solution Expert Domain'),
('role_1767659059640', 'Solution Owner - TwinD', '#9093e8', 'Advanced Predictive Solution'),
('sponsor', 'Sponsor', '#dc2626', 'Provides funding and strategic direction'),
('role_1768004024736', 'Technical Writer', '#dad1d9', 'Documented all technical of software development'),
('role_1768192711512', 'SCRUM Master', '#3b9c55', 'SCRUM Master'),
('role_1768192760112', 'Business Intelligence', '#e8f57f', 'Design Data governance / Data Visualization for business impact'),
('role_1768199877690', 'Solution Owner - AIoT', '#a00177', 'AIoT Solution Owner'),
('role_1768878820001', 'Solution Owner - AIMS', '#a7326a', 'AIMS Solution Owner');

-- Insert Members
INSERT INTO members (id, first_name, last_name, email, phone, company, department, title, location, roles, skills, notes) VALUES
('m1767942011978', 'Ampol', 'Trathong', 'ampoltra@scg.com', '', 'REPCO', '', '', '', ARRAY['analyst', 'consultant', 'designer', 'developer', 'role_1768181992317', 'coordinator', 'project_manager', 'tester', 'architect', 'solution_owner'], ARRAY[]::TEXT[], ''),
('m1766371530200', 'Chaiwat', 'Jearvoranunt', 'chaiwjea@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['consultant', 'developer', 'role_1768181992317', 'role_1766371538643', 'project_manager'], ARRAY[]::TEXT[], ''),
('m1766371690958', 'Chanawut', 'Sawasdee', 'chanawsa@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766371766809', 'Chanikarn', 'Tipjanrawee', 'CHANIKTI@SCG.COM', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'solution_owner', 'consultant', 'role_1766371339835'], ARRAY[]::TEXT[], ''),
('m1766371834417', 'Chulalux', 'Onpanicharee', 'chulaluo@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['sponsor', 'solution_owner', 'analyst', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1768003996717', 'Jarin', 'Julaboot', 'jarinjul@scg.com', '', 'REPCO', '', '', '', ARRAY['project_manager', 'solution_owner', 'developer', 'designer', 'analyst', 'tester', 'architect', 'consultant', 'coordinator', 'role_1766371380234', 'role_1768004024736'], ARRAY[]::TEXT[], ''),
('m1766378357531', 'Kittikun', 'Chongcharoen', 'kittikch@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'developer', 'consultant', 'coordinator', 'role_1766371380234'], ARRAY[]::TEXT[], ''),
('m1766378428718', 'Kontee', 'Thanduan', 'konteet@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'developer', 'designer', 'analyst', 'architect', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1768181846215', 'Nutratanon', 'Mahakhet', 'nutratam@scg.com', '', 'REPCO', '', '', '', ARRAY['analyst', 'consultant', 'role_1766371380234', 'developer', 'role_1768181992317', 'role_1766371538643', 'project_manager', 'tester', 'architect', 'role_1768004024736'], ARRAY[]::TEXT[], ''),
('m1766378506033', 'Pairote', 'Phruethiworakulchai', 'pairotep@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766366613850', 'Panit', 'Panitruttiwong', 'panitp@scg.com', '', 'REPCO', '', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1767943759235', 'Santad', 'Khandipanichakul', 'santadk@scg.com', '', 'REPCO', '', '', '', ARRAY['consultant', 'solution_owner', 'role_1768180942042'], ARRAY[]::TEXT[], ''),
('m1766378597017', 'Santipap', ' Umpawanwong', 'santipau@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'consultant', 'coordinator', 'role_1766371339835'], ARRAY[]::TEXT[], ''),
('m1766378669065', 'Sarun', 'Homsuwan', 'sarunhom@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'architect', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766378770909', 'Suriyachack', 'Archwichai', 'suriyaca@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'architect', 'consultant'], ARRAY[]::TEXT[], ''),
('m1766378860116', 'Teerasak', 'Swangchokpaha', 'TEERASSW@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'solution_owner', 'developer', 'designer', 'analyst', 'architect', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766378940864', 'Tiyawut', 'Tiyawongsakul', 'tiyawutt@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'tester', 'architect', 'consultant', 'coordinator', 'role_1766371339835'], ARRAY[]::TEXT[], ''),
('m1766379018880', 'Tossaporn', 'Rungrojkijjakarn', 'tossapru@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'architect', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766379100265', 'Tutpol', 'Ardsomang', 'tutpola@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'tester', 'architect', 'consultant', 'coordinator', 'role_1766371339835'], ARRAY[]::TEXT[], ''),
('m1766379175610', 'Uriwan', ' Angkhawey', 'uriwanan@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'developer', 'designer', 'analyst', 'tester', 'architect', 'consultant', 'coordinator', 'role_1766371380234'], ARRAY[]::TEXT[], ''),
('m1766379271053', 'Watcharid', 'Chartsuwan', 'watcchar@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'solution_owner', 'developer', 'designer', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766379363759', 'Wee', 'Chabthanom', 'weec@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'architect', 'consultant', 'coordinator'], ARRAY[]::TEXT[], ''),
('m1766379443857', 'Wityanant', 'Thongsawai', 'wityanat@scg.com', '', 'REPCO', 'DRS', '', '', ARRAY['project_manager', 'sponsor', 'solution_owner', 'analyst', 'tester', 'architect', 'consultant', 'coordinator', 'role_1766371339835', 'role_1766371380234'], ARRAY[]::TEXT[], ''),
('m1768188302995', 'Wittawat', ' Susawananon', 'witawats@scg.com', '', 'REPCO', '', '', '', ARRAY['analyst', 'consultant', 'role_1766371561674', 'project_manager', 'solution_owner'], ARRAY[]::TEXT[], ''),
('m1768193222510', 'Suttiporn', 'Jansombun', 'suttipja@scg.com', '', 'REPCO', '', '', '', ARRAY['analyst', 'role_1768192760112', 'consultant', 'role_1766371380234'], ARRAY[]::TEXT[], ''),
('m1768200059824', 'Siripong', 'Cheanklin', 'siriponc@scg.com', '', 'REPCO', '', '', '', ARRAY['consultant', 'coordinator', 'project_manager', 'solution_owner', 'sponsor'], ARRAY[]::TEXT[], ''),
('m1768271243363', 'Wuttichai', 'Chaiyananrittikul', 'wuttichc@scg.com', '', 'REPCO', '', '', '', ARRAY['analyst', 'consultant', 'coordinator', 'project_manager', 'solution_owner'], ARRAY[]::TEXT[], '');

-- Insert Partners
INSERT INTO partners (id, name, categories, location, contact, scope, agreement_type, agreement_doc, agreement_purpose, contract_value, liabilities, effective_date, expiry_date, notes, agreement, agreement_period) VALUES
('p1768207136431', ' Massachusetts Institute of Technology', ARRAY['academic'], '{"address": "", "city": "Massachusetts", "country": "US", "latitude": 44.59195811047049, "longitude": -71.44573104763728}', '{"person": "Mr.Brabra", "email": "Brabra@MIT.ac.us", "phone": ""}', 'AI for FITOPO', 'MOU', '', '', NULL, '', '2026-01-01', '2026-01-12', '', NULL, NULL),
('p1766048785882', ' ZiFiSense Asia', ARRAY['technology', 'operations'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.806121025290116, "longitude": 100.53850167070068}', '{"person": "Mr.002", "email": "sales-zifisenseasia@scg.com", "phone": ""}', 'Smart OFA / Spectrum analysis', '', '', '', NULL, '', '2025-01-01', '2027-12-09', '', '{}', NULL),
('p1766045824151', 'AVEVA', ARRAY['marketing', 'strategy', 'technology'], '{"address": "", "city": "Cambridge", "country": "UK", "latitude": 52.23251656251125, "longitude": 0.14979720122106777}', '{"person": "Eric Chen", "email": "AVEVATraining@aveva.com", "phone": "001800013332"}', E'Platfrom owner\nMarketing arm via MSP (UHM on CONNECT is the first product)', 'Contract', '', '', NULL, '', '2025-01-01', '2026-01-01', '', NULL, NULL),
('p1766046497129', 'B.GRIMM POWER', ARRAY['strategy', 'customer'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.749834810467737, "longitude": 100.64706896838896}', '{"person": "ดร. เกฮาร์ด ลิงค์ ", "email": "Link@bgrimm.com", "phone": "+66 (0) 2710 3400"}', 'Customer and Strategic Partner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766049371284', 'Baker Hughes', ARRAY['technology'], '{"address": "", "city": "Houston", "country": "US", "latitude": 29.875072663738816, "longitude": -95.53509179287099}', '{"person": "Mr.003", "email": "Mr003@BH.com", "phone": ""}', 'Vibration sensors & system', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766106902687', 'Calibr8', ARRAY['technology', 'marketing'], '{"address": "", "city": "Pasig", "country": "PHL", "latitude": 14.584803557441157, "longitude": 121.06261355777151}', '{"person": "Mr.004", "email": "team@younicagency.com", "phone": "25310-2705"}', 'AVEVA partner ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766050753290', 'CognosDX', ARRAY['technology'], '{"address": "", "city": "Chonburi", "country": "TH", "latitude": 12.889974584704, "longitude": 100.94477198518632}', '{"person": "Mr.004", "email": "info@cognosdx.com", "phone": "+44 7785 474123"}', '????', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766047590043', 'Critical Facility (CFT)', ARRAY['technology'], '{"address": "", "city": "Changi", "country": "SG", "latitude": 1.3668647297052798, "longitude": 103.96854866499326}', '{"person": "ประทีป กิ่งทอง", "email": "enquiry@critical-facility.com", "phone": ""}', 'Advance lightning system', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766107249632', 'Dimension Software', ARRAY['technology'], '{"address": "", "city": "Auckland", "country": "NZL", "latitude": -36.90259748453857, "longitude": 174.8098933548698}', '{"person": "Mr.005", "email": "info@dimensionsoftwarenz.com", "phone": ""}', 'Excilentier , Hima', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cancel', '{}', NULL),
('p1766049671071', 'Ematica', ARRAY['technology'], '{"address": "", "city": "Vimercate", "country": "IT", "latitude": 45.59955154388095, "longitude": 9.358456297234445}', '{"person": "Pasquale Munno", "email": "pasquale.munno@e-matica.it", "phone": ""}', 'Asset visualization', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766365638529', 'FLOWLAB & SERVICE', ARRAY['marketing'], '{"address": "", "city": "Rayong", "country": "TH", "latitude": 12.756206966780082, "longitude": 101.17156998564953}', '{"person": "Mr.Surachart", "email": "marketing@flowlabservice.co.th", "phone": ""}', '???', 'MOU', '', 'Marketing Arm', 5, 'No', '2025-01-09', NULL, '', '{}', 0.1),
('p1768207493216', 'Huawei', ARRAY['finance', 'technology'], '{"address": "", "city": "Guangdong", "country": "CN", "latitude": 22.653133717219262, "longitude": 114.06111359822452}', '{"person": "Mr.Hotline", "email": "DPAPsupport@huawei.com", "phone": ""}', 'Product supplier', '', '', '', NULL, '', '', '', '', NULL, NULL),
('p1766047023566', 'Infinite Control', ARRAY['cat_1766108849075', 'marketing'], '{"address": "", "city": "Bangko", "country": "TH", "latitude": 13.708699834814189, "longitude": 100.63516160933118}', '{"person": "K.เต้", "email": "info@infinitecontrol.co.th", "phone": ""}', 'Use for AVEVA Endorsed System Integrator', 'MOU', '', '', NULL, '', '2025-09-01', '2026-09-01', '', NULL, NULL),
('p1766108775375', 'KMITL', ARRAY['academic', 'technology'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.73034746583771, "longitude": 100.77905841672616}', '{"person": "Dr.xxx", "email": "xxx@KMITL.ac.th", "phone": ""}', 'Cira core(AI Vision) ', 'MOU', '', '', NULL, '', '', '', '', NULL, NULL),
('p1766046058164', 'KMUTT', ARRAY['academic', 'technology'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.651627513408583, "longitude": 100.4972260013833}', '{"person": "ผศ. ดร. เดี่ยว กุลพิรักษ์", "email": "diew.koo@kmutt.ac.th", "phone": ""}', 'MES, ERP, Digital Transformation', 'MOU', '', '', NULL, '', '2025-10-01', '2026-03-31', '', NULL, NULL),
('p1767662930275', 'N/A', ARRAY['technology'], '{"address": "271 Sukhumvit Road,Map Ta Phut", "city": "Rayong", "country": "Thailand", "latitude": 12.75833585241643, "longitude": 101.16526779151633}', '{"person": "Panit Panitruttiwong", "email": "panitp@scg.com", "phone": "0962917532"}', 'Own develop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766047958676', 'Partisan Consulting', ARRAY['technology'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.92723710084108, "longitude": 100.54520572497853}', '{"person": "Visitsathapong", "email": "c.visitsathapong@partisanconsulting.com", "phone": ""}', 'Dynamic Process Analysis (TOPO)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766047242928', 'Schneider Electric', ARRAY['technology'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.547989931643428, "longitude": 100.66492078329924}', '{"person": "Mr.001", "email": "customercare.th@schneider-electric.com", "phone": ""}', 'Electrical Technology ETAP, Electrical Equipment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766048368363', 'TRIDIAGONAL SOLUTIONS', ARRAY['technology'], '{"address": "", "city": "Pune", "country": "IND", "latitude": 18.550904395634735, "longitude": 73.77392833453268}', '{"person": "Vaishnavi  Rathi", "email": "vaishnavi.rathi@tridiagonal.com", "phone": ""}', 'CFD / FEA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1766108118528', 'Univers', ARRAY['technology'], '{"address": "", "city": "Harbourfront Avenue Keppel Bay", "country": "SG", "latitude": 1.2649106901561917, "longitude": 103.81828177132789}', '{"person": "Mr.006", "email": "006@univers.com", "phone": "+65 63519288"}', 'Energy management across renewables, batteries, buildings, and transport.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'O&M solar team', '{}', NULL),
('p1768199252902', 'University of Oxford', ARRAY['academic'], '{"address": "", "city": "Oxford", "country": "UK", "latitude": 51.75712913385266, "longitude": -1.253584507595129}', '{"person": "Prof.XX", "email": "xx@oxford.ac.uk", "phone": ""}', 'Co-develop on Transformer Health Sensor [Oil Analysis]', '', '', '', NULL, '', '', '', '', NULL, NULL),
('p1766108484372', 'WEDO', ARRAY['technology'], '{"address": "", "city": "Bangkok", "country": "TH", "latitude": 13.80432723974654, "longitude": 100.53846665879145}', '{"person": "Mr.007", "email": "WEDO@scg.com", "phone": ""}', 'MCA sensors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{}', NULL),
('p1768275649998', 'TOPPAN Ecquaria', ARRAY['finance', 'technology'], '{"address": "11 Toa Payoh Lorong 3, #02-31 Block C Jackson Square, Singapore 319579", "city": "Jackson Square", "country": "SG", "latitude": 1.3372928355390024, "longitude": 103.85013170133587}', '{"person": "Erik Feng", "email": "erikfeng@toppanecquaria.com", "phone": "(+65) 6837 2822 "}', E'KAIZEN Digital Platform\nTOPPAN Ecquaria Digital ID\nEcquaria Government Platform (EGP)\nEcquaria Integration Centre (EIC)\nEcquaria Monitoring Stack (EMS)\nEcquaria DevSecOps Stack\nEcquaria Business Licensing System\nEcquaria SNAP\nEcquaria SOP', '', '', '', NULL, '', '2025-12-17', '', '', NULL, NULL);

-- Insert Projects
INSERT INTO projects (id, partner_id, name, scope, expectation, start_time, end_time, cost, progress, phase, team_members, kpis, market_status, profitability_status, scalability_status, resource_status, technology_status, budget_status, risk_status, schedule_status) VALUES
('proj1766363701827', 'p1766045824151', 'UHM on AVEVA CONNECT', 'AVEVA MSP program for', 'AVEVA marketing arm to increase revenue, start from UHM and extend to other solutions', '2025-10-01', '2026-03-31', 1000000, 25, 'Incubate', '[{"memberId": "m1766379100265", "roleId": "project_manager", "fteAllocation": [0.1, 0.2, 0.2, 0.3, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766379363759", "roleId": "sponsor", "fteAllocation": [0, 0, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768003996717", "roleId": "role_1768004024736", "fteAllocation": [0, 0, 0.3, 0.3, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766379100265", "roleId": "consultant", "fteAllocation": [0, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Yellow', 'Green', 'Yellow', 'Green', 'Yellow'),
('proj1767942241112', 'p1767662930275', 'FITOPO-AI Powered : Dynamic Process Analysis', E'MVP without AI as Aj.Lek MVP Jan-2026\nGo-live AI-powered within Dec-2026\n', '', '2025-10-09', '2026-12-25', 0, 12, 'Incubate', '[{"memberId": "m1767942011978", "roleId": "analyst", "fteAllocation": [0.1, 0.1, 0.3, 0.3, 0.1, 0, 0, 0, 0, 0, 0, 0.1]}, {"memberId": "m1767942011978", "roleId": "developer", "fteAllocation": [0.2, 0.2, 0.2, 0.3, 0.3, 0.2, 0.2, 0.3, 0.2, 0.3, 0.3, 0.4]}, {"memberId": "m1767943759235", "roleId": "role_1768180942042", "fteAllocation": [0.2, 0.1, 0.2, 0.3, 0.1, 0.1, 0.2, 0.1, 0.1, 0.2, 0.2, 0.3]}, {"memberId": "m1768181846215", "roleId": "developer", "fteAllocation": [0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]}, {"memberId": "m1766371530200", "roleId": "role_1766371538643", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.1]}, {"memberId": "m1768181846215", "roleId": "role_1768181992317", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0.1]}]', '[]', 'Green', 'Green', 'Green', 'Yellow', 'Green', 'Yellow', 'Green', 'Green'),
('proj1767944282283', 'p1767662930275', 'Process Optimization :  TwinD', E'Build application as commit with customer\nDesign approval from customer > Dec-2025\nMVP > Q1-2026\nDevelop 6 sprints [1 month/sprint] > 3-2026\nUAT > Deploy > Trainining > go-live Q1-2027 \n', '', '2025-11-01', '2027-01-31', 0, 10, 'Incubate', '[{"memberId": "m1766378940864", "roleId": "project_manager", "fteAllocation": [0.2, 0.2, 0.3, 0.3, 0.2, 0.2, 0.3, 0.2, 0.2, 0.3, 0.3, 0.4]}, {"memberId": "m1767942011978", "roleId": "coordinator", "fteAllocation": [0.1, 0.2, 0.3, 0.3, 0.2, 0.2, 0.3, 0.2, 0.2, 0.3, 0.3, 0.4]}, {"memberId": "m1767942011978", "roleId": "analyst", "fteAllocation": [0.1, 0.2, 0.3, 0.3, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Yellow', 'Yellow', 'Green', 'Green', 'Green', 'Green'),
('proj1766364449149', 'p1766047590043', 'BOLTS', E'Lightning detection system \nWaiting AOT ตอบหนังสือทวงถาม\nไปต่อหรือพอแค่นี้', 'New business', '2024-01-22', '2026-03-31', 3000000, 90, 'Introduction', '[]', '[]', 'Yellow', 'Green', 'Green', 'Yellow', 'Green', 'Green', 'Green', 'Yellow'),
('proj1766364232371', 'p1766047023566', 'MOU with Infifnite', 'MOU >> ???', '', '2025-06-30', '2026-05-31', 0, 100, 'Ideate', '[]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1766364663036', 'p1766045824151', 'Romeo > RTO (Real Time Optimization)', 'Study and find opportunity', E'Discuss with B.Grimm for use-case\n> Postpone project to next year Y2026 [บ่อวิน]\n> GMEC GMPD', '2025-03-01', '2025-07-16', 0, 10, 'Ideate', '[]', '[]', 'Yellow', 'Yellow', 'Green', 'Yellow', 'Green', 'Yellow', 'Green', 'Red'),
('proj1767659048999', 'p1766049371284', 'Baker Hughes MOU Project', E'Business partner\n1. Joke deal on boiler with Aditaya', 'Completed MOU signed', '2025-10-01', '2026-01-30', 0, 20, 'Ideate', '[]', '[]', 'Yellow', 'Yellow', 'Yellow', 'Yellow', 'Green', 'Green', 'Green', 'Yellow'),
('proj1768181455223', 'p1767662930275', 'UHM Version2026, Revsion01', E'1. Improvement on built-in case management. (Phase 1)\n2. Expend feature of statistic analytics  (Phase 2)', '', '2026-01-01', '2026-12-25', 0, 30, 'Incubate', '[{"memberId": "m1768003996717", "roleId": "developer", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768181846215", "roleId": "developer", "fteAllocation": [0.4, 0.4, 0.4, 0.4, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768181846215", "roleId": "role_1768181992317", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Yellow', 'Green', 'Yellow', 'Green', 'Green'),
('proj1768182405397', 'p1767662930275', 'SCG IT internal audit', 'SCG IT internal audit', '', '2026-01-01', '2026-09-30', 0, 5, '2P2S', '[{"memberId": "m1768003996717", "roleId": "solution_owner", "fteAllocation": [0.1, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2, 0.1, 0, 0, 0]}, {"memberId": "m1766371530200", "roleId": "role_1766371538643", "fteAllocation": [0.1, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2, 0.1, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768188676584', 'p1766045824151', 'O&M AIMS', 'O&M', '', '2026-01-01', '2026-12-31', 0, 4, 'O&M', '[{"memberId": "m1768188302995", "roleId": "role_1766371561674", "fteAllocation": [0.2, 0.1, 0.2, 0.1, 0.1, 0.2, 0.1, 0.2, 0.3, 0.3, 0.3, 0.3]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768188858720', 'p1767662930275', 'O&M RVS, MCA, SmartOFA', 'O&M', '', '2026-01-01', '2026-12-31', 0, 4, 'O&M', '[{"memberId": "m1766371530200", "roleId": "role_1766371538643", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2, 0.2]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768189045363', 'p1767662930275', 'iReport for Tank Terminal', 'Obsolete management', '', '2025-10-01', '2026-12-31', 0, 10, 'Obsolescence', '[{"memberId": "m1766379100265", "roleId": "role_1768180953222", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0.1, 0.1, 0.1]}, {"memberId": "m1768003996717", "roleId": "coordinator", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0.1, 0.1, 0.1]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768189256250', 'p1767662930275', 'O&M UHM Room ', 'Prepare UHM room to support Pre-sale & marketing', '', '2026-01-01', '2026-12-31', 0, 4, 'O&M', '[{"memberId": "m1768188302995", "roleId": "role_1766371561674", "fteAllocation": [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2]}, {"memberId": "m1766371530200", "roleId": "", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768189634097', 'p1767662930275', 'Workforce Management for Protech Team', 'Phase 2 of Protech workforce platform', '', '2026-02-01', '2026-06-30', 80000, 1, '2P2S', '[{"memberId": "m1766371530200", "roleId": "project_manager", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766371530200", "roleId": "architect", "fteAllocation": [0, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766371530200", "roleId": "coordinator", "fteAllocation": [0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766371530200", "roleId": "tester", "fteAllocation": [0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766371530200", "roleId": "role_1768181992317", "fteAllocation": [0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768188302995", "roleId": "solution_owner", "fteAllocation": [0.1, 0.1, 0, 0, 0, 0.2, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768190018607', 'p1767662930275', 'SmartOFA NEX', E'ล้างป่าช้า : New platform [Microservice, Update technology Stack > Design system, AI-Powered ]', '', '2026-02-01', '2026-12-31', 0, 0, 'Ideate', '[{"memberId": "m1766378357531", "roleId": "project_manager", "fteAllocation": [0, 0.2, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2]}, {"memberId": "m1766378357531", "roleId": "solution_owner", "fteAllocation": [0, 0.1, 0.1, 0, 0, 0.1, 0, 0, 0.1, 0, 0, 0.1]}, {"memberId": "m1768003996717", "roleId": "architect", "fteAllocation": [0, 0.1, 0.2, 0.2, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768003996717", "roleId": "designer", "fteAllocation": [0, 0, 0.1, 0.2, 0.2, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768003996717", "roleId": "coordinator", "fteAllocation": [0, 0, 0.1, 0.1, 0.1, 0.2, 0.1, 0.1, 0.2, 0.1, 0.1, 0.2]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768190456161', 'p1767662930275', 'ISO27001 Certificate', 'To get ISO27001 certificate within Y2026', '', '2025-11-01', '2026-12-31', 0, 7, '2P2S', '[{"memberId": "m1768003996717", "roleId": "project_manager", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]}, {"memberId": "m1767942011978", "roleId": "role_1768004024736", "fteAllocation": [0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768190692505', 'p1767662930275', 'AI-Powered Technology Architecture', 'Build roadmap and technology stack for future products', '', '2025-11-01', '2026-03-31', 0, 5, '2P2S', '[{"memberId": "m1768181846215", "roleId": "project_manager", "fteAllocation": [0.1, 0.1, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768181846215", "roleId": "architect", "fteAllocation": [0.1, 0.2, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768190859804', 'p1767662930275', 'REPCO Nex Marketing Website version2026', 'Website of REPCO Nex', '', '2025-11-01', '2026-03-31', 0, 15, 'Execution', '[{"memberId": "m1766371530200", "roleId": "consultant", "fteAllocation": [0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768003996717", "roleId": "consultant", "fteAllocation": [0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768197980140', 'p1767662930275', 'PSM', 'PSM', '', '', '2025-12-31', 0, 100, 'EndOfLife', '[]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198082536', 'p1767662930275', 'CCTV imgae processing', 'CCTV imgae processing', '', '', '2025-12-31', 0, 100, 'EndOfLife', '[]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198205419', 'p1767662930275', 'CSM', 'CSM platform', '', '', '2026-12-31', 0, 5, 'Phase-Out', '[]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198348197', 'p1767662930275', 'Truck Loading System', 'Truck loading system platform', '', '', '2026-12-31', 0, 10, 'Phase-Out', '[{"memberId": "m1766379100265", "roleId": "project_manager", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1768003996717", "roleId": "coordinator", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198655549', 'p1767662930275', 'Furnance Twin', 'Furnace Digital Twin', '', '', '', 0, 0, 'Ideate', '[{"memberId": "m1766378940864", "roleId": "project_manager", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198732749', 'p1767662930275', 'RVS AI+', 'RVS embedded  AI+ function', '', '', '', 0, 0, 'Ideate', '[{"memberId": "m1766378357531", "roleId": "project_manager", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198816929', 'p1767662930275', 'PriSM Nex', 'PriSM Nex', '', '', '', 0, 0, 'Ideate', '[{"memberId": "m1766379100265", "roleId": "project_manager", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768198869196', 'p1767662930275', 'AIMS Portal', 'AIMS Portal', '', '', '', 0, 0, 'Ideate', '[{"memberId": "m1766378669065", "roleId": "project_manager", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768199002359', 'p1768199252902', 'Transformer Health Sensors', 'Transformer Health Sensors : Oil Analysis', '', '', '', 0, 0, 'Ideate', '[{"memberId": "m1766378357531", "roleId": "coordinator", "fteAllocation": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green'),
('proj1768199477921', 'p1767662930275', 'Data Center APM & Maintenance', 'New biz for data center [Maintenance value chain]', '', '2026-01-09', '2026-12-31', 0, 1, 'Ideate', '[{"memberId": "m1766379018880", "roleId": "project_manager", "fteAllocation": [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]}, {"memberId": "m1768271243363", "roleId": "consultant", "fteAllocation": [0.1, 0.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1766379018880", "roleId": "role_1768180953222", "fteAllocation": [0.1, 0.1, 0.2, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]}]', '[]', 'Green', 'Green', 'Green', 'Yellow', 'Green', 'Yellow', 'Yellow', 'Yellow'),
('proj1768878702552', 'p1767662930275', 'DMS Migration Y2026', 'Migrate DMS in SCGC (34 plants)', '', '2026-01-05', '2026-07-31', 0, 5, 'Execution', '[{"memberId": "m1767942011978", "roleId": "developer", "fteAllocation": [0.1, 0.1, 0.05, 0, 0, 0, 0, 0, 0, 0, 0, 0]}, {"memberId": "m1767942011978", "roleId": "analyst", "fteAllocation": [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0]}]', '[]', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green', 'Green');

-- =============================================
-- CREATE INDEXES FOR BETTER PERFORMANCE
-- =============================================

CREATE INDEX idx_members_email ON members(email);
CREATE INDEX idx_partners_name ON partners(name);
CREATE INDEX idx_projects_partner_id ON projects(partner_id);
CREATE INDEX idx_projects_phase ON projects(phase);

-- =============================================
-- GRANT PERMISSIONS (for Supabase)
-- =============================================

-- Enable Row Level Security (optional - uncomment if needed)
-- ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE roles ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE members ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE partners ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

-- Grant access to authenticated users (optional - uncomment if needed)
-- GRANT ALL ON categories TO authenticated;
-- GRANT ALL ON roles TO authenticated;
-- GRANT ALL ON members TO authenticated;
-- GRANT ALL ON partners TO authenticated;
-- GRANT ALL ON projects TO authenticated;

-- =============================================
-- DONE
-- =============================================
