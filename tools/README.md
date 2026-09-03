# Maintenance Tools

- `validate_touchosc_feedback.js`：验证主Patch的对象命名、连线端点，以及TouchOSC完整布局的节点ID和场景／计时反馈脚本。
- `add_touchosc_feedback_to_max.js`：以幂等方式维护主Patch中的TouchOSC输入、状态回传和组合transport心跳。
- `generate_nostos_touchosc_full.js`：公开仓库中默认更新现有`nostos_full.tosc`的根级反馈脚本；如果同时提供简化布局源文件，则可执行完整重建流程。
- `generate_nostos_touchosc.js`：保留的源布局生成器；完整重建需要未随公开发行包提供的空白TouchOSC version 6模板`nostos.blank.tosc`。
- `add_teaching_monitor.js`：幂等生成主Patch底部的B版教学监视器、15个模块编号和只读音频监听支路。
- `validate_teaching_monitor.js`：检查教学模块行、全局Scripting Name、连线端点、监听单向边界和监视区对象重叠。

从仓库根目录运行：

```bash
node tools/validate_touchosc_feedback.js
node tools/validate_teaching_monitor.js
```

构建脚本会直接修改正式资产。运行前请提交或备份当前改动，并在Max与TouchOSC中重新打开生成后的文件完成运行时测试。
