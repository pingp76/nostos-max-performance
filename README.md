# Nostos：一句话的返航

一个使用 Max/MSP 制作的约五分钟实验声音表演。现场录制观众朗读的一句话，让它经历“出发／战争 → 破碎／漂流 → 重组／归返”，最后以完整原句返回。

## 主要文件

- `Nostos_Performance_v01.maxpat`：当前单文件学习／演出 Patch。
- `NOSTOS_PERFORMANCE_SCRIPT_v01.md`：任何操作者均可照着执行的逐分钟表演操作谱。
- `NOSTOS_WORKING_DOCUMENT.md`：项目目标、声音设计、控制原则、技术规范和决策记录。
- `Nostos_01_divine_reverse_selector.maxpat`：早期倒放与逐渐显现实验 Patch。
- `AGENTS.md`：后续协作和修改规则。

## 使用方法

1. 使用 Max 9 打开 `Nostos_Performance_v01.maxpat`。
2. 点击 `RESET`，确认 MASTER 约为 `-12 dB`、MUTE和PAUSE均为0。
3. 开启 DSP。
4. 按 `NOSTOS_PERFORMANCE_SCRIPT_v01.md` 完成录音和表演。

TouchOSC 默认监听 UDP 9000。没有 TouchOSC 或摄像头时，也可以完全使用 Max Patch 上方带 `控:` 标记的控件完成演出。

## 当前状态

这是第一版可排练原型。Stage 预设、时间结构和声音参数仍会根据实际试听继续调整。

