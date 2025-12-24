# 🧮 8×32 Synchronous FIFO in Verilog

This project implements an **8-depth, 32-bit wide Synchronous FIFO (First-In First-Out)** memory buffer using **Verilog HDL**.
A synchronous FIFO operates within a **single clock domain**, making it suitable for high-speed digital systems where controlled data buffering and flow regulation are required.

FIFO is a fundamental building block in **VLSI, SoC, and FPGA designs**, especially for managing data transfer between producer and consumer blocks.

---

## 🔧 Key Highlights

* ✅ Fully synchronous design (single clock)
* 📦 32-bit wide data path
* 🔁 Circular buffer with pointer roll-over
* 🚫 Overrun and underrun protection
* 🚦 Full, Empty, Almost Full, Almost Empty flags
* 🧪 Comprehensive testbench support
* 🌐 Simulation-ready (EDA Playground / ModelSim / Vivado)

---

## 📐 FIFO Specifications

| Parameter     | Value                        |
| ------------- | ---------------------------- |
| FIFO Depth    | 8 entries                    |
| Data Width    | 32 bits                      |
| Address Width | 3 bits                       |
| Clock Domain  | Single (Synchronous)         |
| Reset Type    | Active-low synchronous reset |

---

## 🧾 FIFO Interface

| Signal Name    | Direction | Description                   |
| -------------- | --------- | ----------------------------- |
| `clk`          | Input     | Clock signal                  |
| `rst`          | Input     | Active-low synchronous reset  |
| `wen`          | Input     | Write enable                  |
| `ren`          | Input     | Read enable                   |
| `w_data`       | Input     | 32-bit write data             |
| `r_data`       | Output    | 32-bit read data              |
| `full`         | Output    | FIFO is full (write disabled) |
| `empty`        | Output    | FIFO is empty (read disabled) |
| `almost_full`  | Output    | FIFO nearly full (count ≥ 6)  |
| `almost_empty` | Output    | FIFO nearly empty (count ≤ 2) |
| `wp`           | Output    | Write pointer                 |
| `rp`           | Output    | Read pointer                  |

---

## 🔁 FIFO Control Logic

* **Write Operation**
  When `wr_en = 1` **AND** `full = 0`
  → Data is written into FIFO
  → Write pointer (`wr_ptr`) increments

* **Read Operation**
  When `rd_en = 1` **AND** `empty = 0`
  → Data is read from FIFO
  → Read pointer (`rd_ptr`) increments

---

## 🚦 Status Flag Conditions

| Flag           | Condition       |
| -------------- | --------------- |
| `full`         | FIFO count == 8 |
| `empty`        | FIFO count == 0 |
| `almost_full`  | FIFO count ≥ 6  |
| `almost_empty` | FIFO count ≤ 2  |

### 🛡 Protection Mechanisms

* **Overrun Protection**: Write is blocked when FIFO is full
* **Underrun Protection**: Read is blocked when FIFO is empty

---

## 🧪 Testbench Verification Flow

The testbench validates FIFO behavior using the following sequence:

### ✅ Write Phase

* Random 32-bit data written until FIFO becomes full
* Full and almost-full flags monitored

### 🔍 Internal Inspection

* FIFO memory contents observed before any read operation

### ✅ Read Phase

* Data read sequentially until FIFO becomes empty
* Empty and almost-empty flags verified

### 🔍 Post-Read Inspection

* FIFO memory and pointers checked after complete read

---

## 🧪 Functional Test Scenarios Covered

✔️ Normal write → read operation
✔️ Full and empty flag assertion
✔️ Almost full and almost empty thresholds
✔️ Pointer roll-over behavior
✔️ Overrun and underrun attempts
✔️ Reset during operation
✔️ Read without write & write without read

---

## 📊 Simulation & Waveforms

Simulation waveforms clearly demonstrate:

* Write and read enable behavior
* Pointer increments and roll-over
* Full / Empty flag transitions
* Almost Full / Almost Empty warnings

---

## ⚙️ Tools & Technologies

* **Language**: Verilog HDL (IEEE 1364-2001)
* **Simulation**:
  * Vivado Simulator
* **Platform**: local simulation supported

---

## 📌 Applications

* 🧠 Digital system buffering
* 🔄 Data rate mismatch handling
* 🧩 SoC interconnect pipelines
* 🚀 FPGA-based designs
* 🔐 Flow control logic

---

## 👨‍💻 Author

**Jeel Khadasancha**
Electronics / VLSI / Digital Design Enthusiast

---

## ⭐ If you find this useful

Give the repository a ⭐ and feel free to fork or contribute!

---
