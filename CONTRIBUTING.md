# Contributing

感谢你对Nostos的关注。提交Issue或Pull Request前，请尽量提供：

- Max版本、操作系统和音频设备。
- 是否使用TouchOSC或MCP。
- 可复现步骤、预期结果和实际结果。
- 与问题相关的Max Console信息；不要上传API key、局域网地址或个人录音。

修改Patch时请遵守以下约定：

- 每个Max对象都必须具有唯一、稳定、语义化的Scripting Name。
- `Nostos_Performance_v01.maxpat`与`Nostos_GrainVoice.maxpat`必须保持可共同加载。
- 新声音路径必须经过模块增益和唯一的总输出安全链。
- 不要让手势、随机机制或MCP承担紧急静音等关键安全操作。
- 修改TouchOSC反馈后运行`node tools/validate_touchosc_feedback.js`。
- 改变演出流程时同步更新`NOSTOS_PERFORMANCE_SCRIPT_v01.md`和`NOSTOS_WORKING_DOCUMENT.md`。
