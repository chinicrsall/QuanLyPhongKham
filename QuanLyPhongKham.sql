CREATE DATABASE quan_ly_phong_kham;

USE quan_ly_phong_kham;

CREATE TABLE BENH_NHAN (
    ma_benh_nhan INT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE,
    gioi_tinh VARCHAR(10),
    so_dien_thoai VARCHAR(15),
    dia_chi VARCHAR(255)
);
DESCRIBE BENH_NHAN;

CREATE TABLE BAC_SI (
    ma_bac_si INT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    chuyen_khoa VARCHAR(100),
    so_dien_thoai VARCHAR(15)
);
DESCRIBE BAC_SI;

CREATE TABLE LICH_HEN (
    ma_lich_hen INT PRIMARY KEY,
    ma_benh_nhan INT NOT NULL,
    ma_bac_si INT NOT NULL,
    ngay_hen DATE NOT NULL,
    gio_hen TIME NOT NULL,
    trang_thai VARCHAR(30),

    FOREIGN KEY (ma_benh_nhan) REFERENCES BENH_NHAN(ma_benh_nhan),

    FOREIGN KEY (ma_bac_si) REFERENCES BAC_SI(ma_bac_si)
);

CREATE TABLE BENH_AN (
    ma_benh_an INT PRIMARY KEY,
    ma_benh_nhan INT NOT NULL,
    ma_bac_si INT NOT NULL,
    trieu_chung TEXT,
    chan_doan TEXT,
    ket_luan TEXT,
    ngay_kham DATE NOT NULL,

    FOREIGN KEY (ma_benh_nhan)
        REFERENCES BENH_NHAN(ma_benh_nhan),

    FOREIGN KEY (ma_bac_si)
        REFERENCES BAC_SI(ma_bac_si)
);

CREATE TABLE DON_THUOC (
    ma_don_thuoc INT PRIMARY KEY,
    ma_benh_nhan INT NOT NULL,
    ma_bac_si INT NOT NULL,
    ngay_ke_don DATE NOT NULL,
    ghi_chu TEXT,

    FOREIGN KEY (ma_benh_nhan)
        REFERENCES BENH_NHAN(ma_benh_nhan),

    FOREIGN KEY (ma_bac_si)
        REFERENCES BAC_SI(ma_bac_si)
);

CREATE TABLE THUOC (
    ma_thuoc INT PRIMARY KEY,
    ten_thuoc VARCHAR(100) NOT NULL,
    don_vi VARCHAR(30),
    don_gia DECIMAL(12,2) NOT NULL,
    so_luong INT NOT NULL
);  

CREATE TABLE CHI_TIET_DON_THUOC (
    ma_chi_tiet INT PRIMARY KEY,
    ma_don_thuoc INT NOT NULL,
    ma_thuoc INT NOT NULL,
    so_luong INT NOT NULL,
    lieu_dung VARCHAR(255),
    huong_dan VARCHAR(255),

    FOREIGN KEY (ma_don_thuoc)
        REFERENCES DON_THUOC(ma_don_thuoc),

    FOREIGN KEY (ma_thuoc)
        REFERENCES THUOC(ma_thuoc)
);

CREATE TABLE HOA_DON (
    ma_hoa_don INT PRIMARY KEY,
    ma_benh_nhan INT NOT NULL,
    tien_kham DECIMAL(12,2) NOT NULL,
    tien_thuoc DECIMAL(12,2) NOT NULL,
    tong_tien DECIMAL(12,2) NOT NULL,
    trang_thai_thanh_toan VARCHAR(30),
    ngay_lap DATE NOT NULL,

    FOREIGN KEY (ma_benh_nhan)
        REFERENCES BENH_NHAN(ma_benh_nhan)
);

CREATE TABLE THANH_TOAN (
    ma_thanh_toan INT PRIMARY KEY,
    ma_hoa_don INT NOT NULL,
    ngay_thanh_toan DATE NOT NULL,
    so_tien DECIMAL(12,2) NOT NULL,
    phuong_thuc_thanh_toan VARCHAR(30),
    trang_thai VARCHAR(30),

    FOREIGN KEY (ma_hoa_don)
        REFERENCES HOA_DON(ma_hoa_don)
);

SHOW TABLES;
SHOW CREATE TABLE BENH_NHAN;
SHOW CREATE TABLE BAC_SI;
SHOW CREATE TABLE LICH_HEN;
SHOW CREATE TABLE BENH_AN;
SHOW CREATE TABLE DON_THUOC;
SHOW CREATE TABLE CHI_TIET_DON_THUOC;
SHOW CREATE TABLE THUOC;
SHOW CREATE TABLE HOA_DON;
SHOW CREATE TABLE THANH_TOAN;

    INSERT INTO BENH_NHAN
    (ma_benh_nhan, ho_ten, ngay_sinh, gioi_tinh, so_dien_thoai, dia_chi)
    VALUES
    (1, 'Nguyen Van An', '2002-05-15', 'Nam', '0901234567', 'Ha Noi'),
    (2, 'Tran Thi Binh', '2001-08-20', 'Nu', '0912345678', 'Ha Noi'),
    (3, 'Le Van Cuong', '1998-03-10', 'Nam', '0923456789', 'Bac Ninh'),
    (4, 'Pham Thi Dung', '2000-11-25', 'Nu', '0934567890', 'Ha Noi'),
    (5, 'Hoang Van Em', '1995-07-12', 'Nam', '0945678901', 'Hung Yen');

SELECT * FROM BENH_NHAN;    

INSERT INTO BAC_SI
(ma_bac_si, ho_ten, chuyen_khoa, so_dien_thoai)
VALUES
(1, 'Nguyen Van Minh', 'Noi tong quat', '0901111111'),
(2, 'Tran Thi Lan', 'Da lieu', '0912222222'),
(3, 'Le Quoc Bao', 'Tai mui hong', '0923333333'),
(4, 'Pham Thi Huong', 'Nhi khoa', '0934444444'),
(5, 'Hoang Van Nam', 'Tim mach', '0945555555');

SELECT * FROM BAC_SI;

INSERT INTO THUOC
(ma_thuoc, ten_thuoc, don_vi, don_gia, so_luong)
VALUES
(1, 'Paracetamol 500mg', 'Vien', 1000.00, 500),
(2, 'Amoxicillin 500mg', 'Vien', 2000.00, 300),
(3, 'Vitamin C 500mg', 'Vien', 1500.00, 400),
(4, 'Cetirizine 10mg', 'Vien', 1200.00, 250),
(5, 'Omeprazole 20mg', 'Vien', 2500.00, 200),
(6, 'Berberin 100mg', 'Vien', 800.00, 300),
(7, 'Ibuprofen 400mg', 'Vien', 1800.00, 350),
(8, 'Oresol', 'Goi', 5000.00, 100),
(9, 'Alpha Choay', 'Vien', 3000.00, 150),
(10, 'Efferalgan 500mg', 'Vien', 2500.00, 200);
SELECT*FROM THUOC;

INSERT INTO LICH_HEN
(ma_lich_hen, ma_benh_nhan, ma_bac_si, ngay_hen, gio_hen, trang_thai)
VALUES
(1, 1, 1, '2026-10-01', '08:00:00', 'Da dat'),
(2, 2, 2, '2026-10-01', '09:00:00', 'Da kham'),
(3, 3, 3, '2026-10-02', '08:30:00', 'Da kham'),
(4, 4, 4, '2026-10-03', '10:00:00', 'Da dat'),
(5, 5, 5, '2026-10-04', '14:00:00', 'Da kham');
SELECT*FROM LICH_HEN;

INSERT INTO BENH_AN
(ma_benh_an, ma_benh_nhan, ma_bac_si, trieu_chung, chan_doan, ket_luan, ngay_kham)
VALUES
(1, 1, 1, 'Sot, dau dau', 'Cam cum thong thuong', 'Nghi ngoi va uong nhieu nuoc', '2026-10-01'),
(2, 2, 2, 'Ngua, noi man do', 'Di ung da', 'Theo doi phan ung di ung', '2026-10-01'),
(3, 3, 3, 'Dau hong, ho', 'Viem hong', 'Dieu tri theo don thuoc', '2026-10-02'),
(4, 4, 4, 'Sot, ho nhe', 'Cam cum', 'Theo doi nhiet do', '2026-10-03'),
(5, 5, 5, 'Dau nguc nhe', 'Theo doi tim mach', 'Can tai kham neu trieu chung tang', '2026-10-04');
SELECT*FROM BENH_AN;

INSERT INTO DON_THUOC
(ma_don_thuoc, ma_benh_nhan, ma_bac_si, ngay_ke_don, ghi_chu)
VALUES
(1, 1, 1, '2026-10-01', 'Uong sau khi an'),
(2, 2, 2, '2026-10-01', 'Theo doi phan ung'),
(3, 3, 3, '2026-10-02', 'Uong dung lieu'),
(4, 4, 4, '2026-10-03', 'Uong sau khi an'),
(5, 5, 5, '2026-10-04', 'Theo doi trieu chung');
SELECT*FROM DON_THUOC;

INSERT INTO CHI_TIET_DON_THUOC
(ma_chi_tiet, ma_don_thuoc, ma_thuoc, so_luong, lieu_dung, huong_dan)
VALUES
(1, 1, 1, 10, '1 vien x 2 lan/ngay', 'Uong sau khi an'),
(2, 1, 3, 10, '1 vien x 1 lan/ngay', 'Uong sau bua sang'),

(3, 2, 4, 7, '1 vien/ngay', 'Uong vao buoi toi'),
(4, 2, 6, 10, '1 vien x 2 lan/ngay', 'Uong sau khi an'),

(5, 3, 2, 10, '1 vien x 2 lan/ngay', 'Uong sau khi an'),
(6, 3, 1, 10, '1 vien khi sot', 'Khong dung qua lieu'),

(7, 4, 1, 10, '1 vien x 2 lan/ngay', 'Uong sau khi an'),
(8, 4, 8, 5, '1 goi/ngay', 'Pha voi nuoc'),

(9, 5, 7, 10, '1 vien x 2 lan/ngay', 'Uong sau khi an'),
(10, 5, 5, 10, '1 vien/ngay', 'Uong truoc khi an');

SELECT*FROM CHI_TIET_DON_THUOC;

INSERT INTO HOA_DON
(ma_hoa_don, ma_benh_nhan, tien_kham, tien_thuoc, tong_tien, trang_thai_thanh_toan, ngay_lap)
VALUES
(1, 1, 100000.00, 25000.00, 125000.00, 'Da thanh toan', '2026-10-01'),
(2, 2, 100000.00, 20000.00, 120000.00, 'Da thanh toan', '2026-10-01'),
(3, 3, 100000.00, 30000.00, 130000.00, 'Da thanh toan', '2026-10-02'),
(4, 4, 100000.00, 30000.00, 130000.00, 'Chua thanh toan', '2026-10-03'),
(5, 5, 150000.00, 43000.00, 193000.00, 'Da thanh toan', '2026-10-04');
SELECT*FROM HOA_DON;

INSERT INTO THANH_TOAN
(ma_thanh_toan, ma_hoa_don, ngay_thanh_toan, so_tien, phuong_thuc_thanh_toan, trang_thai)
VALUES
(1, 1, '2026-10-01', 125000.00, 'Tien mat', 'Thanh cong'),
(2, 2, '2026-10-01', 120000.00, 'Chuyen khoan', 'Thanh cong'),
(3, 3, '2026-10-02', 130000.00, 'Tien mat', 'Thanh cong'),
(4, 5, '2026-10-04', 193000.00, 'Chuyen khoan', 'Thanh cong');  
SELECT*FROM THANH_TOAN;

SELECT *
FROM BENH_NHAN
WHERE gioi_tinh = 'Nam';

SELECT *
FROM THUOC
ORDER BY don_gia ASC;

SELECT 
    lh.ma_lich_hen,
    bn.ho_ten AS ten_benh_nhan,
    bs.ho_ten AS ten_bac_si,
    lh.ngay_hen,
    lh.gio_hen,
    lh.trang_thai
FROM LICH_HEN lh
JOIN BENH_NHAN bn 
    ON lh.ma_benh_nhan = bn.ma_benh_nhan
JOIN BAC_SI bs 
    ON lh.ma_bac_si = bs.ma_bac_si;

SELECT
    dt.ma_don_thuoc,
    bn.ho_ten AS ten_benh_nhan,
    bs.ho_ten AS ten_bac_si,
    t.ten_thuoc,
    ct.so_luong,
    ct.lieu_dung,
    ct.huong_dan
FROM DON_THUOC dt
JOIN BENH_NHAN bn
    ON dt.ma_benh_nhan = bn.ma_benh_nhan
JOIN BAC_SI bs
    ON dt.ma_bac_si = bs.ma_bac_si
JOIN CHI_TIET_DON_THUOC ct
    ON dt.ma_don_thuoc = ct.ma_don_thuoc
JOIN THUOC t
    ON ct.ma_thuoc = t.ma_thuoc;

SELECT 
    gioi_tinh,
    COUNT(*) AS so_luong
FROM BENH_NHAN
GROUP BY gioi_tinh;  

SELECT 
    SUM(tong_tien) AS tong_doanh_thu
FROM HOA_DON
WHERE trang_thai_thanh_toan = 'Da thanh toan';

ALTER TABLE BENH_NHAN
ADD CONSTRAINT uq_benh_nhan_sdt UNIQUE (so_dien_thoai);

ALTER TABLE BAC_SI
ADD CONSTRAINT uq_bac_si_sdt UNIQUE (so_dien_thoai);

INSERT INTO BENH_NHAN
(ma_benh_nhan, ho_ten, ngay_sinh, gioi_tinh, so_dien_thoai, dia_chi)
VALUES
(6, 'Test Unique', '2000-01-01', 'Nam', '0901234567', 'Ha Noi');

ALTER TABLE BENH_NHAN
ADD CONSTRAINT chk_gioi_tinh
CHECK (gioi_tinh IN ('Nam', 'Nu', 'Khac'));

ALTER TABLE THUOC
ADD CONSTRAINT chk_so_luong
CHECK (so_luong >= 0);

SHOW TRIGGERS;

CREATE TRIGGER trg_kiem_tra_so_luong_thuoc
BEFORE INSERT ON THUOC
FOR EACH ROW
SET NEW.so_luong = IF(NEW.so_luong < 0, 0, NEW.so_luong);



INSERT INTO THUOC
(ma_thuoc, ten_thuoc, don_vi, don_gia, so_luong)
VALUES
(11, 'Thuoc Test Trigger', 'Vien', 1000, -10);
SELECT *
FROM THUOC
WHERE ma_thuoc = 11;

CREATE PROCEDURE sp_tim_benh_nhan(IN p_ma_benh_nhan INT)
SELECT *
FROM BENH_NHAN
WHERE ma_benh_nhan = p_ma_benh_nhan;

CREATE PROCEDURE sp_thong_ke_doanh_thu()
SELECT
    COUNT(*) AS so_hoa_don,
    SUM(tong_tien) AS tong_doanh_thu
FROM HOA_DON
WHERE trang_thai_thanh_toan = 'Da thanh toan';

CALL sp_tim_benh_nhan(1);
CALL sp_thong_ke_doanh_thu();

SHOW PROCEDURE STATUS
WHERE Db = 'quan_ly_phong_kham';