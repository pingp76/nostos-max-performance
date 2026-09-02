{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            50,
            50,
            2500,
            1200
        ],
        "gridsize": [
            10,
            10
        ],
        "description": "Nostos five-minute performance and learning patch",
        "tags": "Nostos voice TouchOSC performance",
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 24,
                    "id": "label_title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        20,
                        1500,
                        40
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        15,
                        1000,
                        40
                    ],
                    "text": "NOSTOS：一句话的返航 — 五分钟演出主 Patch（学习展开版）",
                    "varname": "label_title"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_reading",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        62,
                        2200,
                        25
                    ],
                    "text": "学习阅读顺序：①录音与buffer → ②场景／控件／预设／计时 → ③Stage 1 → ④Stage 2 → ⑤Stage 3 → ⑥总输出 → ⑦TouchOSC。每个Stage从左到右阅读；紫色“控:”是演出操作，蓝色“入口”是动作／参数入口，灰蓝“核心处理／汇合点”是关键声音组件。",
                    "varname": "label_reading"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_record_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        105,
                        1200,
                        34
                    ],
                    "text": "1｜录音、共享 buffer 与原句播放",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_record_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_record_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        142,
                        1100,
                        25
                    ],
                    "text": "先开启 DSP；RECORD 开始／停止录音；PLAY ORIGINAL 播放刚录下的实际时长。最长 15 秒。",
                    "varname": "label_record_help"
                }
            },
            {
                "box": {
                    "id": "rec_adc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        200,
                        70,
                        22
                    ],
                    "text": "adc~ 1",
                    "varname": "rec_adc"
                }
            },
            {
                "box": {
                    "id": "rec_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        130,
                        180,
                        18,
                        80
                    ],
                    "varname": "rec_meter"
                }
            },
            {
                "box": {
                    "id": "rec_record",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        240,
                        200,
                        165,
                        22
                    ],
                    "text": "record~ nostos_voice 1",
                    "varname": "rec_record"
                }
            },
            {
                "box": {
                    "id": "rec_buffer",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "float",
                        "bang"
                    ],
                    "patching_rect": [
                        450,
                        200,
                        205,
                        22
                    ],
                    "text": "buffer~ nostos_voice 15000 1",
                    "varname": "rec_buffer"
                }
            },
            {
                "box": {
                    "buffername": "nostos_voice",
                    "id": "rec_waveform",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [
                        "float",
                        "float",
                        "float",
                        "float",
                        "list",
                        ""
                    ],
                    "patching_rect": [
                        700,
                        175,
                        730,
                        150
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        490,
                        1040,
                        125
                    ],
                    "varname": "rec_waveform"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12,
                    "id": "label_waveform",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        700,
                        332,
                        500,
                        23
                    ],
                    "text": "waveform~ 只显示录音；本 Patch 没有连接擦除操作。",
                    "varname": "label_waveform"
                }
            },
            {
                "box": {
                    "id": "ui_record",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        40,
                        295,
                        36,
                        36
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        80,
                        42,
                        42
                    ],
                    "varname": "ui_record"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_record",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        85,
                        292,
                        100,
                        42
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        70,
                        78,
                        100,
                        42
                    ],
                    "text": "控: RECORD\n1=录音 0=停止",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_record"
                }
            },
            {
                "box": {
                    "id": "rec_control_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        335,
                        100,
                        22
                    ],
                    "text": "s rec_control",
                    "varname": "rec_control_send"
                }
            },
            {
                "box": {
                    "id": "rec_control_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        370,
                        100,
                        22
                    ],
                    "text": "r rec_control",
                    "varname": "rec_control_receive"
                }
            },
            {
                "box": {
                    "id": "rec_select",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        160,
                        370,
                        65,
                        22
                    ],
                    "text": "sel 1 0",
                    "varname": "rec_select"
                }
            },
            {
                "box": {
                    "id": "rec_start_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "int",
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        245,
                        350,
                        65,
                        22
                    ],
                    "text": "t 1 b b",
                    "varname": "rec_start_order"
                }
            },
            {
                "box": {
                    "id": "rec_stop_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        "int"
                    ],
                    "patching_rect": [
                        245,
                        390,
                        55,
                        22
                    ],
                    "text": "t b 0",
                    "varname": "rec_stop_order"
                }
            },
            {
                "box": {
                    "id": "rec_clear",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        335,
                        350,
                        45,
                        22
                    ],
                    "text": "clear",
                    "varname": "rec_clear"
                }
            },
            {
                "box": {
                    "id": "rec_timer",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "float",
                        ""
                    ],
                    "patching_rect": [
                        405,
                        370,
                        50,
                        22
                    ],
                    "text": "timer",
                    "varname": "rec_timer"
                }
            },
            {
                "box": {
                    "id": "rec_duration",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        480,
                        370,
                        95,
                        22
                    ],
                    "varname": "rec_duration"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12,
                    "id": "label_duration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        480,
                        342,
                        120,
                        23
                    ],
                    "text": "录音时长 ms",
                    "varname": "label_duration"
                }
            },
            {
                "box": {
                    "id": "rec_duration_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595,
                        370,
                        125,
                        22
                    ],
                    "text": "s rec_duration_ms",
                    "varname": "rec_duration_send"
                }
            },
            {
                "box": {
                    "id": "ui_clear",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        335,
                        295,
                        28,
                        28
                    ],
                    "varname": "ui_clear"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12,
                    "id": "label_clear",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        375,
                        300,
                        70,
                        20
                    ],
                    "text": "CLEAR",
                    "varname": "label_clear"
                }
            },
            {
                "box": {
                    "id": "ui_play",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        500,
                        295,
                        36,
                        36
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        230,
                        80,
                        42,
                        42
                    ],
                    "varname": "ui_play"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_play",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        550,
                        303,
                        145,
                        26
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        280,
                        90,
                        150,
                        26
                    ],
                    "text": "控: PLAY ORIGINAL",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_play"
                }
            },
            {
                "box": {
                    "id": "rec_play_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        700,
                        410,
                        105,
                        22
                    ],
                    "text": "s play_original",
                    "varname": "rec_play_send"
                }
            },
            {
                "box": {
                    "id": "rec_play_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        820,
                        370,
                        105,
                        22
                    ],
                    "text": "r play_original",
                    "varname": "rec_play_receive"
                }
            },
            {
                "box": {
                    "id": "rec_duration_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        820,
                        410,
                        125,
                        22
                    ],
                    "text": "r rec_duration_ms",
                    "varname": "rec_duration_receive"
                }
            },
            {
                "box": {
                    "id": "rec_duration_store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        965,
                        370,
                        65,
                        22
                    ],
                    "text": "f 5000.",
                    "varname": "rec_duration_store"
                }
            },
            {
                "box": {
                    "id": "rec_start_prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1050,
                        370,
                        115,
                        22
                    ],
                    "text": "prepend start 0",
                    "varname": "rec_start_prepend"
                }
            },
            {
                "box": {
                    "id": "rec_player",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1190,
                        370,
                        130,
                        22
                    ],
                    "text": "play~ nostos_voice",
                    "varname": "rec_player"
                }
            },
            {
                "box": {
                    "id": "rec_stop_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1050,
                        410,
                        110,
                        22
                    ],
                    "text": "r stop_original",
                    "varname": "rec_stop_receive"
                }
            },
            {
                "box": {
                    "id": "rec_stop_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1190,
                        410,
                        45,
                        22
                    ],
                    "text": "stop",
                    "varname": "rec_stop_message"
                }
            },
            {
                "box": {
                    "id": "reset_stop_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1600,
                        410,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "reset_stop_receive"
                }
            },
            {
                "box": {
                    "id": "reset_stop_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1705,
                        410,
                        110,
                        22
                    ],
                    "text": "s stop_original",
                    "varname": "reset_stop_send"
                }
            },
            {
                "box": {
                    "id": "rec_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1340,
                        370,
                        55,
                        22
                    ],
                    "text": "*~ 0.6",
                    "varname": "rec_level"
                }
            },
            {
                "box": {
                    "id": "rec_send_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1420,
                        355,
                        160,
                        22
                    ],
                    "text": "send~ nostos_original_l",
                    "varname": "rec_send_l"
                }
            },
            {
                "box": {
                    "id": "rec_send_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1420,
                        395,
                        160,
                        22
                    ],
                    "text": "send~ nostos_original_r",
                    "varname": "rec_send_r"
                }
            },
            {
                "box": {
                    "id": "mcp_server",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [
                            55,
                            113,
                            1000,
                            780
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        100,
                                        110,
                                        22
                                    ],
                                    "text": "udpreceive 7400",
                                    "varname": "mcp_udpr"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 20,
                                    "numoutlets": 20,
                                    "outlettype": [
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        150,
                                        520,
                                        22
                                    ],
                                    "text": "route /newdefault /connect /disconnect /delete /dsp /send /dump /setbox /attribute /ping /rename /script /target /console_get /console_clear /list_windows /front_window /encapsulate /live",
                                    "varname": "mcp_route"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        210,
                                        170,
                                        22
                                    ],
                                    "text": "prepend script newdefault",
                                    "varname": "mcp_pnew"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        129.625,
                                        244,
                                        150,
                                        22
                                    ],
                                    "text": "prepend script connect",
                                    "varname": "mcp_pcon"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        192.25,
                                        277,
                                        160,
                                        22
                                    ],
                                    "text": "prepend script disconnect",
                                    "varname": "mcp_pdis"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        332,
                                        140,
                                        22
                                    ],
                                    "text": "prepend script delete",
                                    "varname": "mcp_pdel"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        505.375,
                                        244,
                                        150,
                                        22
                                    ],
                                    "text": "prepend script send",
                                    "varname": "mcp_psend"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [
                                        "bang",
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        317.5,
                                        193,
                                        60,
                                        22
                                    ],
                                    "text": "sel 1 0",
                                    "varname": "mcp_sel"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        317.5,
                                        224,
                                        55,
                                        35
                                    ],
                                    "text": ";\rdsp start",
                                    "varname": "mcp_dspon"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        374.5,
                                        224,
                                        54,
                                        35
                                    ],
                                    "text": ";\rdsp stop",
                                    "varname": "mcp_dspoff"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        380,
                                        308,
                                        120,
                                        22
                                    ],
                                    "text": "print void_send",
                                    "varname": "mcp_print"
                                }
                            },
                            {
                                "box": {
                                    "filename": "dump.js",
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        442.75,
                                        187,
                                        100,
                                        22
                                    ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0
                                    },
                                    "text": "v8 dump.js",
                                    "textfile": {
                                        "filename": "dump.js",
                                        "flags": 0,
                                        "embed": 0,
                                        "autowatch": 1
                                    },
                                    "varname": "mcp_dump"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        442.75,
                                        277,
                                        160,
                                        22
                                    ],
                                    "text": "udpsend 127.0.0.1 7401",
                                    "varname": "mcp_udps"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "",
                                        ""
                                    ],
                                    "patching_rect": [
                                        204.5,
                                        383,
                                        300,
                                        22
                                    ],
                                    "saved_object_attributes": {
                                        "autostart": 1,
                                        "defer": 0,
                                        "watch": 1
                                    },
                                    "text": "node.script chat.js @autostart 1 @watch 1",
                                    "textfile": {
                                        "filename": "chat.js",
                                        "flags": 0,
                                        "embed": 0,
                                        "autowatch": 1
                                    },
                                    "varname": "mcp_node"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-34",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        223.82501200000002,
                                        468,
                                        30,
                                        30
                                    ],
                                    "varname": "mcp_internal_obj_34"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        340,
                                        120,
                                        22
                                    ],
                                    "text": "prepend script send",
                                    "varname": "mcp_psend_n"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-47",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        610,
                                        300,
                                        70,
                                        22
                                    ],
                                    "text": "tosymbol",
                                    "varname": "mcp_send_tosymbol"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        610,
                                        340,
                                        80,
                                        22
                                    ],
                                    "text": "fromsymbol",
                                    "varname": "mcp_send_fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-36",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        380,
                                        140,
                                        22
                                    ],
                                    "text": "prepend script setattr",
                                    "varname": "mcp_pattr"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        442.75,
                                        220,
                                        180,
                                        22
                                    ],
                                    "text": "/pong",
                                    "varname": "mcp_internal_obj_37"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        410,
                                        140,
                                        22
                                    ],
                                    "text": "prepend script rename",
                                    "varname": "mcp_prename"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        440,
                                        120,
                                        22
                                    ],
                                    "text": "prepend script",
                                    "varname": "mcp_pscript"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        254.875,
                                        470,
                                        120,
                                        22
                                    ],
                                    "text": "prepend target",
                                    "varname": "mcp_ptarget"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        510,
                                        111,
                                        22
                                    ],
                                    "text": "prepend clear",
                                    "varname": "mcp_internal_obj_41"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        545,
                                        125,
                                        22
                                    ],
                                    "text": "prepend windows",
                                    "varname": "mcp_internal_obj_42"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-43",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        580,
                                        111,
                                        22
                                    ],
                                    "text": "prepend front",
                                    "varname": "mcp_internal_obj_43"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        615,
                                        118,
                                        22
                                    ],
                                    "text": "prepend script",
                                    "varname": "mcp_internal_obj_44"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-45",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        650,
                                        118,
                                        22
                                    ],
                                    "text": "prepend script",
                                    "varname": "mcp_internal_obj_45"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        67,
                                        685,
                                        118,
                                        22
                                    ],
                                    "text": "prepend script",
                                    "varname": "mcp_internal_obj_46"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maxpacket-init",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        620,
                                        277,
                                        210,
                                        22
                                    ],
                                    "text": "loadmess maxpacketsize 60000",
                                    "varname": "mcp_udp_init"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-2",
                                        0
                                    ],
                                    "source": [
                                        "obj-1",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-13",
                                        0
                                    ],
                                    "order": 0,
                                    "source": [
                                        "obj-12",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-16",
                                        0
                                    ],
                                    "midpoints": [
                                        452.25,
                                        262,
                                        427,
                                        262,
                                        427,
                                        295,
                                        364,
                                        295,
                                        364,
                                        319,
                                        214,
                                        319
                                    ],
                                    "order": 1,
                                    "source": [
                                        "obj-12",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-15",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-2",
                                        0
                                    ],
                                    "midpoints": [
                                        214,
                                        406,
                                        52,
                                        406,
                                        52,
                                        145,
                                        76.5,
                                        145
                                    ],
                                    "source": [
                                        "obj-16",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-12",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        6
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-15",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        7
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-3",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-36",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        8
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-37",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        9
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-38",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        10
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-39",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        11
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-4",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-40",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        12
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-41",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        13
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-42",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        14
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-43",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        15
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-44",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        16
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-45",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        17
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-46",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        18
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-47",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        5
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-5",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        2
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-6",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        3
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-7",
                                        0
                                    ],
                                    "source": [
                                        "obj-2",
                                        4
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-3",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-35",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-36",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-13",
                                        0
                                    ],
                                    "source": [
                                        "obj-37",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-38",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-39",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-4",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-40",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-41",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-42",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-43",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-44",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-45",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-46",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-48",
                                        0
                                    ],
                                    "source": [
                                        "obj-47",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-35",
                                        0
                                    ],
                                    "source": [
                                        "obj-48",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-5",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-34",
                                        0
                                    ],
                                    "source": [
                                        "obj-6",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-8",
                                        0
                                    ],
                                    "source": [
                                        "obj-7",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-9",
                                        0
                                    ],
                                    "source": [
                                        "obj-7",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [
                                        "obj-13",
                                        0
                                    ],
                                    "source": [
                                        "obj-maxpacket-init",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        1900,
                        160,
                        95,
                        22
                    ],
                    "text": "p mcp_server",
                    "varname": "mcp_server"
                }
            },
            {
                "box": {
                    "id": "mcp_thispatcher",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        1900,
                        200,
                        90,
                        22
                    ],
                    "save": [
                        "#N",
                        "thispatcher",
                        ";",
                        "#Q",
                        "end",
                        ";"
                    ],
                    "text": "thispatcher",
                    "varname": "mcp_thispatcher"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_mcp_console_reader",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        2020,
                        175,
                        170,
                        22
                    ],
                    "text": "MCP读取Max Console",
                    "varname": "label_mcp_console_reader"
                }
            },
            {
                "box": {
                    "id": "mcp_console_reader",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        2020,
                        200,
                        70,
                        22
                    ],
                    "text": "console",
                    "varname": "mcp_console_reader"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_mcp",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1740,
                        105,
                        332,
                        35
                    ],
                    "text": "MCP BRIDGE\n用于运行时读取、状态和已有参数；不用于重建／保存结构。",
                    "varname": "label_mcp"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_control_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        455,
                        1200,
                        34
                    ],
                    "text": "2｜场景、宏观控制与演出调试遥控",
                    "textcolor": [
                        0.75,
                        0.45,
                        0.15,
                        1
                    ],
                    "varname": "label_control_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_control_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        501,
                        1200,
                        25
                    ],
                    "text": "阅读顺序：场景切换与宏观参数 → 演出／安全遥控 → Stage预设 → 演出计时。BED独立控制背景，AUTO VOICE只开关自动语音。",
                    "varname": "label_control_help"
                }
            },
            {
                "box": {
                    "id": "ui_s1",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        40,
                        574,
                        42,
                        42
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        160,
                        52,
                        52
                    ],
                    "varname": "ui_s1"
                }
            },
            {
                "box": {
                    "id": "ui_s1_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        649,
                        35,
                        22
                    ],
                    "text": "1",
                    "varname": "ui_s1_value"
                }
            },
            {
                "box": {
                    "id": "ui_s2",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        120,
                        574,
                        42,
                        42
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        100,
                        160,
                        52,
                        52
                    ],
                    "varname": "ui_s2"
                }
            },
            {
                "box": {
                    "id": "ui_s2_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        120,
                        649,
                        35,
                        22
                    ],
                    "text": "2",
                    "varname": "ui_s2_value"
                }
            },
            {
                "box": {
                    "id": "ui_s3",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        200,
                        574,
                        42,
                        42
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        180,
                        160,
                        52,
                        52
                    ],
                    "varname": "ui_s3"
                }
            },
            {
                "box": {
                    "id": "ui_s3_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        200,
                        649,
                        35,
                        22
                    ],
                    "text": "3",
                    "varname": "ui_s3_value"
                }
            },
            {
                "box": {
                    "id": "ui_return",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        280,
                        574,
                        42,
                        42
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        260,
                        160,
                        52,
                        52
                    ],
                    "varname": "ui_return"
                }
            },
            {
                "box": {
                    "id": "ui_return_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        649,
                        35,
                        22
                    ],
                    "text": "4",
                    "varname": "ui_return_value"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_stages",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        539,
                        340,
                        26
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        130,
                        360,
                        26
                    ],
                    "text": "控: STAGE 1      STAGE 2      STAGE 3      RETURN",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_stages"
                }
            },
            {
                "box": {
                    "id": "scene_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        365,
                        649,
                        105,
                        22
                    ],
                    "text": "s nostos_scene",
                    "varname": "scene_send"
                }
            },
            {
                "box": {
                    "id": "scene_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        730,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "scene_receive"
                }
            },
            {
                "box": {
                    "id": "scene_select",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 6,
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang",
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        165,
                        730,
                        105,
                        22
                    ],
                    "text": "sel 1 2 3 4 0",
                    "varname": "scene_select"
                }
            },
            {
                "box": {
                    "id": "scene_gain_s1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        693,
                        70,
                        22
                    ],
                    "text": "1. 0. 0.",
                    "varname": "scene_gain_s1"
                }
            },
            {
                "box": {
                    "id": "scene_gain_s2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        730,
                        70,
                        22
                    ],
                    "text": "0. 1. 0.",
                    "varname": "scene_gain_s2"
                }
            },
            {
                "box": {
                    "id": "scene_gain_s3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        768,
                        70,
                        22
                    ],
                    "text": "0. 0. 1.",
                    "varname": "scene_gain_s3"
                }
            },
            {
                "box": {
                    "id": "scene_gain_off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        800,
                        805,
                        70,
                        22
                    ],
                    "text": "0. 0. 0.",
                    "varname": "scene_gain_off"
                }
            },
            {
                "box": {
                    "id": "scene_gain_unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "float",
                        "float",
                        "float"
                    ],
                    "patching_rect": [
                        395,
                        730,
                        120,
                        22
                    ],
                    "text": "unpack 0. 0. 0.",
                    "varname": "scene_gain_unpack"
                }
            },
            {
                "box": {
                    "id": "scene_s1_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        540,
                        693,
                        95,
                        22
                    ],
                    "text": "pack 0. 500",
                    "varname": "scene_s1_pack"
                }
            },
            {
                "box": {
                    "id": "scene_s1_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        655,
                        693,
                        105,
                        22
                    ],
                    "text": "s s1_gain_cmd",
                    "varname": "scene_s1_send"
                }
            },
            {
                "box": {
                    "id": "scene_s2_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        540,
                        743,
                        95,
                        22
                    ],
                    "text": "pack 0. 500",
                    "varname": "scene_s2_pack"
                }
            },
            {
                "box": {
                    "id": "scene_s2_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        655,
                        743,
                        105,
                        22
                    ],
                    "text": "s s2_gain_cmd",
                    "varname": "scene_s2_send"
                }
            },
            {
                "box": {
                    "id": "scene_s3_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        540,
                        793,
                        95,
                        22
                    ],
                    "text": "pack 0. 500",
                    "varname": "scene_s3_pack"
                }
            },
            {
                "box": {
                    "id": "scene_s3_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        655,
                        793,
                        105,
                        22
                    ],
                    "text": "s s3_gain_cmd",
                    "varname": "scene_s3_send"
                }
            },
            {
                "box": {
                    "id": "scene_return_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        395,
                        805,
                        70,
                        22
                    ],
                    "text": "delay 550",
                    "varname": "scene_return_delay"
                }
            },
            {
                "box": {
                    "id": "scene_return_play",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        485,
                        843,
                        105,
                        22
                    ],
                    "text": "s play_original",
                    "varname": "scene_return_play"
                }
            },
            {
                "box": {
                    "id": "scene_display_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        861,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "scene_display_receive"
                }
            },
            {
                "box": {
                    "id": "ui_scene_display",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        165,
                        861,
                        65,
                        22
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390,
                        175,
                        65,
                        22
                    ],
                    "varname": "ui_scene_display"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12,
                    "id": "label_scene_display",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        824,
                        300,
                        23
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        390,
                        140,
                        300,
                        23
                    ],
                    "text": "当前场景：0待机／1／2／3／4返回",
                    "varname": "label_scene_display"
                }
            },
            {
                "box": {
                    "id": "scene_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        260,
                        861,
                        90,
                        22
                    ],
                    "text": "loadmess 0",
                    "varname": "scene_default"
                }
            },
            {
                "box": {
                    "id": "scene_default_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        370,
                        861,
                        105,
                        22
                    ],
                    "text": "s nostos_scene",
                    "varname": "scene_default_send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_transform",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        820,
                        536,
                        112,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        545,
                        205,
                        112,
                        39
                    ],
                    "text": "控: TRANSFORM\n0清晰 100强变形",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_transform"
                }
            },
            {
                "box": {
                    "id": "ui_transform",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        820,
                        605,
                        34,
                        140
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        560,
                        250,
                        38,
                        190
                    ],
                    "size": 101,
                    "varname": "ui_transform"
                }
            },
            {
                "box": {
                    "id": "transform_norm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        870,
                        661,
                        60,
                        22
                    ],
                    "text": "/ 100.",
                    "varname": "transform_norm"
                }
            },
            {
                "box": {
                    "id": "transform_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        945,
                        661,
                        105,
                        22
                    ],
                    "text": "s ctl_transform",
                    "varname": "transform_send"
                }
            },
            {
                "box": {
                    "id": "transform_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        945,
                        711,
                        105,
                        22
                    ],
                    "text": "r ctl_transform",
                    "varname": "transform_receive"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "transform_value",
                    "maxclass": "flonum",
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        945,
                        749,
                        65,
                        22
                    ],
                    "varname": "transform_value"
                }
            },
            {
                "box": {
                    "id": "transform_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        870,
                        799,
                        100,
                        22
                    ],
                    "text": "loadmess 25",
                    "varname": "transform_default"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_density",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1080,
                        536,
                        93,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        665,
                        205,
                        93,
                        39
                    ],
                    "text": "控: DENSITY\n0稀疏 100密集",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_density"
                }
            },
            {
                "box": {
                    "id": "ui_density",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1080,
                        605,
                        34,
                        140
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        680,
                        250,
                        38,
                        190
                    ],
                    "size": 101,
                    "varname": "ui_density"
                }
            },
            {
                "box": {
                    "id": "density_norm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1130,
                        661,
                        60,
                        22
                    ],
                    "text": "/ 100.",
                    "varname": "density_norm"
                }
            },
            {
                "box": {
                    "id": "density_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1205,
                        661,
                        105,
                        22
                    ],
                    "text": "s ctl_density",
                    "varname": "density_send"
                }
            },
            {
                "box": {
                    "id": "density_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1205,
                        711,
                        105,
                        22
                    ],
                    "text": "r ctl_density",
                    "varname": "density_receive"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "density_value",
                    "maxclass": "flonum",
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1205,
                        749,
                        65,
                        22
                    ],
                    "varname": "density_value"
                }
            },
            {
                "box": {
                    "id": "density_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1130,
                        799,
                        100,
                        22
                    ],
                    "text": "loadmess 35",
                    "varname": "density_default"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_voice",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1340,
                        536,
                        73,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        785,
                        205,
                        73,
                        39
                    ],
                    "text": "控: VOICE\n语音存在感",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_voice"
                }
            },
            {
                "box": {
                    "id": "ui_voice",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1340,
                        605,
                        34,
                        140
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        800,
                        250,
                        38,
                        190
                    ],
                    "size": 101,
                    "varname": "ui_voice"
                }
            },
            {
                "box": {
                    "id": "voice_norm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1390,
                        661,
                        60,
                        22
                    ],
                    "text": "/ 100.",
                    "varname": "voice_norm"
                }
            },
            {
                "box": {
                    "id": "voice_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1465,
                        661,
                        105,
                        22
                    ],
                    "text": "s ctl_voice",
                    "varname": "voice_send"
                }
            },
            {
                "box": {
                    "id": "voice_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1465,
                        711,
                        105,
                        22
                    ],
                    "text": "r ctl_voice",
                    "varname": "voice_receive"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "voice_value",
                    "maxclass": "flonum",
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1465,
                        749,
                        65,
                        22
                    ],
                    "varname": "voice_value"
                }
            },
            {
                "box": {
                    "id": "voice_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1390,
                        799,
                        100,
                        22
                    ],
                    "text": "loadmess 75",
                    "varname": "voice_default"
                }
            },
            {
                "box": {
                    "id": "transform_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        945,
                        836,
                        125,
                        22
                    ],
                    "text": "r ui_transform_raw",
                    "varname": "transform_raw_receive"
                }
            },
            {
                "box": {
                    "id": "density_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1205,
                        836,
                        115,
                        22
                    ],
                    "text": "r ui_density_raw",
                    "varname": "density_raw_receive"
                }
            },
            {
                "box": {
                    "id": "voice_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1465,
                        836,
                        105,
                        22
                    ],
                    "text": "r ui_voice_raw",
                    "varname": "voice_raw_receive"
                }
            },
            {
                "box": {
                    "id": "ui_event_a",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        40,
                        980,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        300,
                        60,
                        60
                    ],
                    "varname": "ui_event_a"
                }
            },
            {
                "box": {
                    "id": "ui_event_b",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        120,
                        980,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        110,
                        300,
                        60,
                        60
                    ],
                    "varname": "ui_event_b"
                }
            },
            {
                "box": {
                    "id": "ui_hold",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        200,
                        980,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        200,
                        300,
                        60,
                        60
                    ],
                    "varname": "ui_hold"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_events",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        936,
                        245,
                        26
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        20,
                        270,
                        250,
                        26
                    ],
                    "text": "控: EVENT A       EVENT B       HOLD",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_events"
                }
            },
            {
                "box": {
                    "id": "event_a_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1049,
                        100,
                        22
                    ],
                    "text": "s ctl_event_a",
                    "varname": "event_a_send"
                }
            },
            {
                "box": {
                    "id": "event_b_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        160,
                        1049,
                        100,
                        22
                    ],
                    "text": "s ctl_event_b",
                    "varname": "event_b_send"
                }
            },
            {
                "box": {
                    "id": "hold_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280,
                        1049,
                        90,
                        22
                    ],
                    "text": "s ctl_hold",
                    "varname": "hold_send"
                }
            },
            {
                "box": {
                    "id": "hold_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        280,
                        1086,
                        105,
                        22
                    ],
                    "text": "r ui_hold_raw",
                    "varname": "hold_raw_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_osc_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        5620,
                        1200,
                        34
                    ],
                    "text": "7｜TouchOSC 配置与路由（平时无需调整）",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_osc_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 12,
                    "id": "label_osc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        5675,
                        1900,
                        23
                    ],
                    "text": "TouchOSC：输入UDP 9000；完整地址路由含stage、五个宏观参数、event、record/play、mute/hold、DSP、sync。状态回传使用UDP 9001。",
                    "varname": "label_osc"
                }
            },
            {
                "box": {
                    "id": "osc_udp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        5750,
                        120,
                        22
                    ],
                    "text": "udpreceive 9000",
                    "varname": "osc_udp"
                }
            },
            {
                "box": {
                    "id": "osc_route",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 17,
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        180,
                        5750,
                        1350,
                        22
                    ],
                    "text": "route /nostos/stage /nostos/transform /nostos/density /nostos/voice /nostos/event /nostos/record /nostos/play /nostos/mute /nostos/hold /nostos/reset /nostos/bed /nostos/auto /nostos/bed_particle /nostos/master /nostos/dsp /nostos/sync",
                    "varname": "osc_route"
                }
            },
            {
                "box": {
                    "id": "osc_stage_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        5822,
                        105,
                        22
                    ],
                    "text": "s nostos_scene",
                    "varname": "osc_stage_send"
                }
            },
            {
                "box": {
                    "id": "osc_transform_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        170,
                        5822,
                        70,
                        22
                    ],
                    "text": "clip 0. 1.",
                    "varname": "osc_transform_clip"
                }
            },
            {
                "box": {
                    "id": "osc_transform_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        170,
                        5879,
                        105,
                        22
                    ],
                    "text": "s ctl_transform",
                    "varname": "osc_transform_send"
                }
            },
            {
                "box": {
                    "id": "osc_density_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        300,
                        5822,
                        70,
                        22
                    ],
                    "text": "clip 0. 1.",
                    "varname": "osc_density_clip"
                }
            },
            {
                "box": {
                    "id": "osc_density_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300,
                        5879,
                        95,
                        22
                    ],
                    "text": "s ctl_density",
                    "varname": "osc_density_send"
                }
            },
            {
                "box": {
                    "id": "osc_voice_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420,
                        5822,
                        70,
                        22
                    ],
                    "text": "clip 0. 1.",
                    "varname": "osc_voice_clip"
                }
            },
            {
                "box": {
                    "id": "osc_voice_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        5879,
                        85,
                        22
                    ],
                    "text": "s ctl_voice",
                    "varname": "osc_voice_send"
                }
            },
            {
                "box": {
                    "id": "osc_event_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        700,
                        5822,
                        60,
                        22
                    ],
                    "text": "sel 1 2",
                    "varname": "osc_event_sel"
                }
            },
            {
                "box": {
                    "id": "osc_event_a_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        700,
                        5879,
                        100,
                        22
                    ],
                    "text": "s ctl_event_a",
                    "varname": "osc_event_a_send"
                }
            },
            {
                "box": {
                    "id": "osc_event_b_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        820,
                        5879,
                        100,
                        22
                    ],
                    "text": "s ctl_event_b",
                    "varname": "osc_event_b_send"
                }
            },
            {
                "box": {
                    "id": "osc_record_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        940,
                        5822,
                        100,
                        22
                    ],
                    "text": "s rec_control",
                    "varname": "osc_record_send"
                }
            },
            {
                "box": {
                    "id": "osc_play_sel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1060,
                        5822,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "osc_play_sel"
                }
            },
            {
                "box": {
                    "id": "osc_play_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1120,
                        5822,
                        105,
                        22
                    ],
                    "text": "s play_original",
                    "varname": "osc_play_send"
                }
            },
            {
                "box": {
                    "id": "osc_mute_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1250,
                        5822,
                        80,
                        22
                    ],
                    "text": "s ctl_mute",
                    "varname": "osc_mute_send"
                }
            },
            {
                "box": {
                    "id": "osc_hold_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1350,
                        5822,
                        80,
                        22
                    ],
                    "text": "s ui_hold_raw",
                    "varname": "osc_hold_send"
                }
            },
            {
                "box": {
                    "id": "osc_reset_sel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1555,
                        5822,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "osc_reset_sel"
                }
            },
            {
                "box": {
                    "id": "osc_reset_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1620,
                        5822,
                        80,
                        22
                    ],
                    "text": "s ctl_reset",
                    "varname": "osc_reset_send"
                }
            },
            {
                "box": {
                    "id": "osc_bed_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1720,
                        5822,
                        70,
                        22
                    ],
                    "text": "clip 0. 1.",
                    "varname": "osc_bed_clip"
                }
            },
            {
                "box": {
                    "id": "osc_bed_mul",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1720,
                        5879,
                        60,
                        22
                    ],
                    "text": "* 100.",
                    "varname": "osc_bed_mul"
                }
            },
            {
                "box": {
                    "id": "osc_bed_ui_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1800,
                        5879,
                        100,
                        22
                    ],
                    "text": "s ui_bed_raw",
                    "varname": "osc_bed_ui_send"
                }
            },
            {
                "box": {
                    "id": "osc_auto_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1930,
                        5822,
                        65,
                        22
                    ],
                    "text": "clip 0 1",
                    "varname": "osc_auto_clip"
                }
            },
            {
                "box": {
                    "id": "osc_auto_ui_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1930,
                        5879,
                        130,
                        22
                    ],
                    "text": "s ui_auto_voice_raw",
                    "varname": "osc_auto_ui_send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_debug_remote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        893,
                        1200,
                        26
                    ],
                    "text": "第2区底部集中操作｜EVENT、BED PARTICLE、MASTER、BED、AUTO、MUTE、DSP、RESET",
                    "textcolor": [
                        0.35,
                        0.45,
                        0.9,
                        1
                    ],
                    "varname": "label_debug_remote"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_master_remote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        936,
                        300,
                        25
                    ],
                    "text": "控: MASTER 遥控（-70 至 +6 dB）",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_master_remote"
                }
            },
            {
                "box": {
                    "id": "ui_master_remote",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        420,
                        980,
                        220,
                        24
                    ],
                    "varname": "ui_master_remote"
                }
            },
            {
                "box": {
                    "id": "master_remote_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        660,
                        980,
                        140,
                        22
                    ],
                    "text": "scale 0 127 -70. 6.",
                    "varname": "master_remote_scale"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "ui_master_db",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        815,
                        980,
                        70,
                        22
                    ],
                    "varname": "ui_master_db"
                }
            },
            {
                "box": {
                    "id": "master_remote_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        900,
                        980,
                        120,
                        22
                    ],
                    "text": "s ctl_master_db",
                    "varname": "master_remote_send"
                }
            },
            {
                "box": {
                    "id": "master_remote_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420,
                        1030,
                        100,
                        22
                    ],
                    "text": "loadmess 97",
                    "varname": "master_remote_default"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_mute_remote",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1124,
                        66,
                        39
                    ],
                    "text": "控: MUTE\n紧急静音",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_mute_remote"
                }
            },
            {
                "box": {
                    "id": "ui_mute_remote",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        60,
                        1186,
                        44,
                        44
                    ],
                    "varname": "ui_mute_remote"
                }
            },
            {
                "box": {
                    "id": "mute_remote_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        120,
                        1199,
                        80,
                        22
                    ],
                    "text": "s ctl_mute",
                    "varname": "mute_remote_send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_dsp_remote",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        650,
                        1136,
                        60,
                        25
                    ],
                    "text": "控: DSP",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_dsp_remote"
                }
            },
            {
                "box": {
                    "id": "ui_dsp_remote",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        650,
                        1180,
                        50,
                        50
                    ],
                    "varname": "ui_dsp_remote"
                }
            },
            {
                "box": {
                    "id": "mute_remote_state_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        220,
                        1199,
                        95,
                        22
                    ],
                    "text": "r ctl_mute",
                    "varname": "mute_remote_state_receive"
                }
            },
            {
                "box": {
                    "id": "mute_remote_state_set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        330,
                        1199,
                        85,
                        22
                    ],
                    "text": "prepend set",
                    "varname": "mute_remote_state_set"
                }
            },
            {
                "box": {
                    "id": "reset_master_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        535,
                        1030,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "reset_master_receive"
                }
            },
            {
                "box": {
                    "id": "reset_master_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        635,
                        1030,
                        40,
                        22
                    ],
                    "text": "97",
                    "varname": "reset_master_value"
                }
            },
            {
                "box": {
                    "id": "reset_mute_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        430,
                        1249,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "reset_mute_receive"
                }
            },
            {
                "box": {
                    "id": "reset_mute_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        530,
                        1249,
                        35,
                        22
                    ],
                    "text": "0",
                    "varname": "reset_mute_value"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_reset",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        768,
                        1122,
                        164,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        760,
                        80,
                        164,
                        39
                    ],
                    "text": "控: RESET\n恢复场景预设，不清除录音",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_reset"
                }
            },
            {
                "box": {
                    "id": "ui_reset",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        788.0000005960464,
                        1184.000001847744,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1000,
                        80,
                        52,
                        52
                    ],
                    "varname": "ui_reset"
                }
            },
            {
                "box": {
                    "id": "reset_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        848.0000023841858,
                        1196.6666688919067,
                        80,
                        22
                    ],
                    "text": "s ctl_reset",
                    "varname": "reset_send"
                }
            },
            {
                "box": {
                    "id": "reset_scene_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        948.000005364418,
                        1196.6666688919067,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "reset_scene_receive"
                }
            },
            {
                "box": {
                    "id": "reset_scene_value",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1048.0000083446503,
                        1196.6666688919067,
                        35,
                        22
                    ],
                    "text": "0",
                    "varname": "reset_scene_value"
                }
            },
            {
                "box": {
                    "id": "reset_scene_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1098.0000098347664,
                        1196.6666688919067,
                        105,
                        22
                    ],
                    "text": "s nostos_scene",
                    "varname": "reset_scene_send"
                }
            },
            {
                "box": {
                    "id": "reset_preset_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1900,
                        1249,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "reset_preset_receive"
                }
            },
            {
                "box": {
                    "id": "scene_preset_s1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1360,
                        170,
                        22
                    ],
                    "text": "25 35 75 0 55 1",
                    "varname": "scene_preset_s1"
                }
            },
            {
                "box": {
                    "id": "scene_preset_s2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1390,
                        170,
                        22
                    ],
                    "text": "70 55 70 0 45 1",
                    "varname": "scene_preset_s2"
                }
            },
            {
                "box": {
                    "id": "scene_preset_s3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1420,
                        170,
                        22
                    ],
                    "text": "85 30 80 0 40 1",
                    "varname": "scene_preset_s3"
                }
            },
            {
                "box": {
                    "id": "scene_preset_return",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1450,
                        170,
                        22
                    ],
                    "text": "0 20 100 0 20 0",
                    "varname": "scene_preset_return"
                }
            },
            {
                "box": {
                    "id": "scene_preset_reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1480,
                        170,
                        22
                    ],
                    "text": "25 35 75 0 50 1",
                    "varname": "scene_preset_reset"
                }
            },
            {
                "box": {
                    "id": "scene_preset_unpack",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [
                        "int",
                        "int",
                        "int",
                        "int",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        230,
                        1420,
                        165,
                        22
                    ],
                    "text": "unpack 0 0 0 0 0 0",
                    "varname": "scene_preset_unpack"
                }
            },
            {
                "box": {
                    "id": "preset_transform_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1340,
                        130,
                        22
                    ],
                    "text": "s ui_transform_raw",
                    "varname": "preset_transform_send"
                }
            },
            {
                "box": {
                    "id": "preset_density_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1370,
                        120,
                        22
                    ],
                    "text": "s ui_density_raw",
                    "varname": "preset_density_send"
                }
            },
            {
                "box": {
                    "id": "preset_voice_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1400,
                        110,
                        22
                    ],
                    "text": "s ui_voice_raw",
                    "varname": "preset_voice_send"
                }
            },
            {
                "box": {
                    "id": "preset_hold_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1430,
                        100,
                        22
                    ],
                    "text": "s ui_hold_raw",
                    "varname": "preset_hold_send"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_stage_presets",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1300,
                        760,
                        22
                    ],
                    "text": "Stage预设顺序：TRANSFORM DENSITY VOICE HOLD BED AUTO；切换时自动召回。",
                    "varname": "label_stage_presets"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_bed",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1080,
                        930,
                        106,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        330,
                        205,
                        106,
                        39
                    ],
                    "text": "控: BED\n背景音量 0—100",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_bed"
                }
            },
            {
                "box": {
                    "id": "ui_bed",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1200,
                        980,
                        160,
                        22
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        350,
                        250,
                        38,
                        190
                    ],
                    "size": 101,
                    "varname": "ui_bed"
                }
            },
            {
                "box": {
                    "id": "bed_norm",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1375,
                        980,
                        60,
                        22
                    ],
                    "text": "/ 100.",
                    "varname": "bed_norm"
                }
            },
            {
                "box": {
                    "id": "bed_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1450,
                        980,
                        80,
                        22
                    ],
                    "text": "s ctl_bed",
                    "varname": "bed_send"
                }
            },
            {
                "box": {
                    "id": "bed_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1545,
                        980,
                        95,
                        22
                    ],
                    "text": "loadmess 50",
                    "varname": "bed_default"
                }
            },
            {
                "box": {
                    "id": "bed_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1655,
                        980,
                        90,
                        22
                    ],
                    "text": "r ui_bed_raw",
                    "varname": "bed_raw_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_auto_voice",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1770,
                        924,
                        183,
                        39
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        20,
                        390,
                        183,
                        39
                    ],
                    "text": "控: AUTO VOICE\n1自动语音 0仅背景／手动事件",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_auto_voice"
                }
            },
            {
                "box": {
                    "id": "ui_auto_voice",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1780,
                        980,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        210,
                        390,
                        52,
                        52
                    ],
                    "varname": "ui_auto_voice"
                }
            },
            {
                "box": {
                    "id": "auto_voice_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1840,
                        993,
                        105,
                        22
                    ],
                    "text": "s ctl_auto_voice",
                    "varname": "auto_voice_send"
                }
            },
            {
                "box": {
                    "id": "auto_voice_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1960,
                        993,
                        90,
                        22
                    ],
                    "text": "loadmess 1",
                    "varname": "auto_voice_default"
                }
            },
            {
                "box": {
                    "id": "auto_voice_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        2060,
                        993,
                        125,
                        22
                    ],
                    "text": "r ui_auto_voice_raw",
                    "varname": "auto_voice_raw_receive"
                }
            },
            {
                "box": {
                    "id": "preset_bed_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1460,
                        100,
                        22
                    ],
                    "text": "s ui_bed_raw",
                    "varname": "preset_bed_send"
                }
            },
            {
                "box": {
                    "id": "preset_auto_voice_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        420,
                        1490,
                        130,
                        22
                    ],
                    "text": "s ui_auto_voice_raw",
                    "varname": "preset_auto_voice_send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_s1_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1580,
                        1200,
                        34
                    ],
                    "text": "3｜第一阶段：出发／战争",
                    "textcolor": [
                        0.85,
                        0.25,
                        0.2,
                        1
                    ],
                    "varname": "label_s1_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_s1_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1655,
                        1200,
                        25
                    ],
                    "text": "从左到右阅读：场景启停／DENSITY与事件 → TRANSFORM速度映射与播放器 → VOICE／AUTO → 场景增益与输出。BED在下一行独立汇入。",
                    "varname": "label_s1_help"
                }
            },
            {
                "box": {
                    "id": "s1_scene",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1783,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "s1_scene"
                }
            },
            {
                "box": {
                    "id": "s1_equal",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        178,
                        1783,
                        45,
                        22
                    ],
                    "text": "== 1",
                    "varname": "s1_equal"
                }
            },
            {
                "box": {
                    "id": "s1_change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        249,
                        1783,
                        55,
                        22
                    ],
                    "text": "change",
                    "varname": "s1_change"
                }
            },
            {
                "box": {
                    "id": "s1_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        332,
                        1783,
                        65,
                        22
                    ],
                    "text": "sel 1 0",
                    "varname": "s1_sel"
                }
            },
            {
                "box": {
                    "id": "s1_start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        1753,
                        65,
                        22
                    ],
                    "text": "startloop",
                    "varname": "s1_start"
                }
            },
            {
                "box": {
                    "id": "s1_stop_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        425,
                        1834,
                        75,
                        22
                    ],
                    "text": "delay 520",
                    "varname": "s1_stop_delay"
                }
            },
            {
                "box": {
                    "id": "s1_stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        530,
                        1834,
                        42,
                        22
                    ],
                    "text": "stop",
                    "varname": "s1_stop"
                }
            },
            {
                "box": {
                    "id": "s1_transform",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        1753,
                        105,
                        22
                    ],
                    "text": "r ctl_transform",
                    "varname": "s1_transform"
                }
            },
            {
                "box": {
                    "id": "s1_speed_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        794,
                        1753,
                        140,
                        22
                    ],
                    "text": "scale 0. 1. 1. 0.45",
                    "varname": "s1_speed_scale"
                }
            },
            {
                "box": {
                    "id": "s1_speed_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        970,
                        1753,
                        90,
                        22
                    ],
                    "text": "pack 0. 100",
                    "varname": "s1_speed_pack"
                }
            },
            {
                "box": {
                    "id": "s1_speed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1091,
                        1753,
                        60,
                        22
                    ],
                    "text": "line~ 1.",
                    "varname": "s1_speed_line"
                }
            },
            {
                "box": {
                    "id": "s1_duration",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        1844,
                        125,
                        22
                    ],
                    "text": "r rec_duration_ms",
                    "varname": "s1_duration"
                }
            },
            {
                "box": {
                    "id": "s1_loop_zero",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        816,
                        1844,
                        90,
                        22
                    ],
                    "text": "loadmess 0.",
                    "varname": "s1_loop_zero"
                }
            },
            {
                "box": {
                    "id": "s1_player",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "signal"
                    ],
                    "patching_rect": [
                        1091,
                        1915,
                        210,
                        22
                    ],
                    "text": "groove~ nostos_voice 1 @loop 1",
                    "varname": "s1_player"
                }
            },
            {
                "box": {
                    "id": "s1_voice_static",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1344,
                        1915,
                        60,
                        22
                    ],
                    "text": "*~ 0.5",
                    "varname": "s1_voice_static"
                }
            },
            {
                "box": {
                    "id": "s1_voice",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1344,
                        1753,
                        90,
                        22
                    ],
                    "text": "r ctl_voice",
                    "varname": "s1_voice"
                }
            },
            {
                "box": {
                    "id": "s1_voice_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1459,
                        1753,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s1_voice_pack"
                }
            },
            {
                "box": {
                    "id": "s1_voice_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1575,
                        1753,
                        70,
                        22
                    ],
                    "text": "line~ 0.75",
                    "varname": "s1_voice_line"
                }
            },
            {
                "box": {
                    "id": "s1_voice_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1448,
                        1915,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s1_voice_gain"
                }
            },
            {
                "box": {
                    "id": "s1_auto_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1514,
                        1915,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s1_auto_gain"
                }
            },
            {
                "box": {
                    "id": "s1_auto_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1096,
                        2056,
                        105,
                        22
                    ],
                    "text": "r ctl_auto_voice",
                    "varname": "s1_auto_receive"
                }
            },
            {
                "box": {
                    "id": "s1_auto_store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1234,
                        2056,
                        45,
                        22
                    ],
                    "text": "f 1.",
                    "varname": "s1_auto_store"
                }
            },
            {
                "box": {
                    "id": "s1_auto_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1305,
                        2056,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s1_auto_pack"
                }
            },
            {
                "box": {
                    "id": "s1_auto_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1421,
                        2056,
                        70,
                        22
                    ],
                    "text": "line~ 1.",
                    "varname": "s1_auto_line"
                }
            },
            {
                "box": {
                    "id": "s1_auto_event_on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1096,
                        2128,
                        55,
                        22
                    ],
                    "text": "1. 20",
                    "varname": "s1_auto_event_on"
                }
            },
            {
                "box": {
                    "id": "s1_auto_event_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        1179,
                        2128,
                        80,
                        22
                    ],
                    "text": "delay 1400",
                    "varname": "s1_auto_event_delay"
                }
            },
            {
                "box": {
                    "id": "s1_auto_on_select",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1520,
                        2056,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "s1_auto_on_select"
                }
            },
            {
                "box": {
                    "id": "s1_auto_restart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1520,
                        2128,
                        65,
                        22
                    ],
                    "text": "startloop",
                    "varname": "s1_auto_restart"
                }
            },
            {
                "box": {
                    "id": "s1_event_a",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        678,
                        1975,
                        95,
                        22
                    ],
                    "text": "r ctl_event_a",
                    "varname": "s1_event_a"
                }
            },
            {
                "box": {
                    "id": "s1_reverse",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        783,
                        1975,
                        55,
                        22
                    ],
                    "text": "-1. 60",
                    "varname": "s1_reverse"
                }
            },
            {
                "box": {
                    "id": "s1_reverse_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        865,
                        1975,
                        80,
                        22
                    ],
                    "text": "delay 1200",
                    "varname": "s1_reverse_delay"
                }
            },
            {
                "box": {
                    "id": "s1_reverse_back",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        975,
                        1975,
                        55,
                        22
                    ],
                    "text": "1. 300",
                    "varname": "s1_reverse_back"
                }
            },
            {
                "box": {
                    "id": "s1_event_b",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        678,
                        2056,
                        95,
                        22
                    ],
                    "text": "r ctl_event_b",
                    "varname": "s1_event_b"
                }
            },
            {
                "box": {
                    "id": "s1_lurch",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        783,
                        2056,
                        60,
                        22
                    ],
                    "text": "0.25 60",
                    "varname": "s1_lurch"
                }
            },
            {
                "box": {
                    "id": "s1_lurch_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        871,
                        2056,
                        70,
                        22
                    ],
                    "text": "delay 650",
                    "varname": "s1_lurch_delay"
                }
            },
            {
                "box": {
                    "id": "s1_lurch_back",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        970,
                        2056,
                        55,
                        22
                    ],
                    "text": "1. 250",
                    "varname": "s1_lurch_back"
                }
            },
            {
                "box": {
                    "id": "s1_density",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        1975,
                        90,
                        22
                    ],
                    "text": "r ctl_density",
                    "varname": "s1_density"
                }
            },
            {
                "box": {
                    "id": "s1_rate_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        1975,
                        135,
                        22
                    ],
                    "text": "scale 0. 1. 0.2 8.",
                    "varname": "s1_rate_scale"
                }
            },
            {
                "box": {
                    "id": "s1_rate_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        332,
                        1975,
                        80,
                        22
                    ],
                    "text": "pack 0. 80",
                    "varname": "s1_rate_pack"
                }
            },
            {
                "box": {
                    "id": "s1_rate_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        442,
                        1975,
                        65,
                        22
                    ],
                    "text": "line~ 0.8",
                    "varname": "s1_rate_line"
                }
            },
            {
                "box": {
                    "id": "s1_lfo",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        535,
                        1975,
                        50,
                        22
                    ],
                    "text": "cycle~",
                    "varname": "s1_lfo"
                }
            },
            {
                "box": {
                    "id": "s1_half",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        601,
                        1975,
                        55,
                        22
                    ],
                    "text": "*~ 0.5",
                    "varname": "s1_half"
                }
            },
            {
                "box": {
                    "id": "s1_offset",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        601,
                        2056,
                        60,
                        22
                    ],
                    "text": "+~ 0.5",
                    "varname": "s1_offset"
                }
            },
            {
                "box": {
                    "id": "s1_bed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        161,
                        2147,
                        75,
                        22
                    ],
                    "text": "cycle~ 55.",
                    "varname": "s1_bed"
                }
            },
            {
                "box": {
                    "id": "s1_bed_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        271,
                        2147,
                        60,
                        22
                    ],
                    "text": "*~ 0.09",
                    "varname": "s1_bed_level"
                }
            },
            {
                "box": {
                    "id": "s1_bed_pulse",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        381,
                        2147,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s1_bed_pulse"
                }
            },
            {
                "box": {
                    "id": "s1_bed_user_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        436,
                        2147,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s1_bed_user_gain"
                }
            },
            {
                "box": {
                    "id": "s1_bed_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        2228,
                        80,
                        22
                    ],
                    "text": "r ctl_bed",
                    "varname": "s1_bed_receive"
                }
            },
            {
                "box": {
                    "id": "s1_bed_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        2228,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s1_bed_pack"
                }
            },
            {
                "box": {
                    "id": "s1_bed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        271,
                        2228,
                        70,
                        22
                    ],
                    "text": "line~ 0.5",
                    "varname": "s1_bed_line"
                }
            },
            {
                "box": {
                    "id": "s1_mix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1591,
                        2147,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s1_mix"
                }
            },
            {
                "box": {
                    "id": "s1_gain_cmd",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1679,
                        1996,
                        105,
                        22
                    ],
                    "text": "r s1_gain_cmd",
                    "varname": "s1_gain_cmd"
                }
            },
            {
                "box": {
                    "id": "s1_gain_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1817,
                        1996,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s1_gain_line"
                }
            },
            {
                "box": {
                    "id": "s1_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1679,
                        2147,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s1_gain"
                }
            },
            {
                "box": {
                    "id": "s1_send_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1778,
                        2117,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s1_l",
                    "varname": "s1_send_l"
                }
            },
            {
                "box": {
                    "id": "s1_send_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1778,
                        2198,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s1_r",
                    "varname": "s1_send_r"
                }
            },
            {
                "box": {
                    "id": "s1_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1965,
                        2087,
                        18,
                        80
                    ],
                    "varname": "s1_meter"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_s1_chain",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        995,
                        2269,
                        800,
                        22
                    ],
                    "text": "自动语音与背景分别经过AUTO VOICE和BED控制，再汇入场景gain；重新开启AUTO VOICE时从loop起点开始。",
                    "varname": "label_s1_chain"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_s2_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2380,
                        1200,
                        34
                    ],
                    "text": "4｜第二阶段：破碎／漂流",
                    "textcolor": [
                        0.55,
                        0.3,
                        0.8,
                        1
                    ],
                    "varname": "label_s2_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_s2_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2444,
                        1600,
                        25
                    ],
                    "text": "从左到右阅读：场景与粒子触发 → 粒长／位置计算 → poly~与滤波 → VOICE／场景输出；下半区依次是金属BED与BED PARTICLE。",
                    "varname": "label_s2_help"
                }
            },
            {
                "box": {
                    "id": "s2_scene",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        2597,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "s2_scene"
                }
            },
            {
                "box": {
                    "id": "s2_equal",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        178,
                        2597,
                        45,
                        22
                    ],
                    "text": "== 2",
                    "varname": "s2_equal"
                }
            },
            {
                "box": {
                    "id": "s2_change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        249,
                        2597,
                        55,
                        22
                    ],
                    "text": "change",
                    "varname": "s2_change"
                }
            },
            {
                "box": {
                    "id": "s2_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        332,
                        2597,
                        65,
                        22
                    ],
                    "text": "sel 1 0",
                    "varname": "s2_sel"
                }
            },
            {
                "box": {
                    "id": "s2_metro_on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        2545,
                        35,
                        22
                    ],
                    "text": "1",
                    "varname": "s2_metro_on"
                }
            },
            {
                "box": {
                    "id": "s2_metro_off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        480,
                        2545,
                        35,
                        22
                    ],
                    "text": "0",
                    "varname": "s2_metro_off"
                }
            },
            {
                "box": {
                    "id": "s2_metro",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        425,
                        2597,
                        70,
                        22
                    ],
                    "text": "metro 700",
                    "varname": "s2_metro"
                }
            },
            {
                "box": {
                    "id": "s2_auto_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        524,
                        2545,
                        105,
                        22
                    ],
                    "text": "r ctl_auto_voice",
                    "varname": "s2_auto_receive"
                }
            },
            {
                "box": {
                    "id": "s2_auto_pak",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        524,
                        2597,
                        70,
                        22
                    ],
                    "text": "pak 0 1",
                    "varname": "s2_auto_pak"
                }
            },
            {
                "box": {
                    "id": "s2_auto_expr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        2545,
                        105,
                        22
                    ],
                    "text": "expr $i1 && $i2",
                    "varname": "s2_auto_expr"
                }
            },
            {
                "box": {
                    "id": "s2_auto_change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        794,
                        2545,
                        55,
                        22
                    ],
                    "text": "change",
                    "varname": "s2_auto_change"
                }
            },
            {
                "box": {
                    "id": "s2_density",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        2694,
                        90,
                        22
                    ],
                    "text": "r ctl_density",
                    "varname": "s2_density"
                }
            },
            {
                "box": {
                    "id": "s2_interval_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        2694,
                        165,
                        22
                    ],
                    "text": "scale 0. 1. 1600. 70.",
                    "varname": "s2_interval_scale"
                }
            },
            {
                "box": {
                    "id": "s2_interval_int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        365,
                        2694,
                        30,
                        22
                    ],
                    "text": "i",
                    "varname": "s2_interval_int"
                }
            },
            {
                "box": {
                    "id": "s2_event_a",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        2694,
                        95,
                        22
                    ],
                    "text": "r ctl_event_a",
                    "varname": "s2_event_a"
                }
            },
            {
                "box": {
                    "id": "s2_trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        557,
                        2659,
                        55,
                        22
                    ],
                    "text": "t b b b",
                    "varname": "s2_trigger"
                }
            },
            {
                "box": {
                    "id": "s2_rand_len",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        2597,
                        80,
                        22
                    ],
                    "text": "random 100",
                    "varname": "s2_rand_len"
                }
            },
            {
                "box": {
                    "id": "s2_len_plus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        766,
                        2597,
                        55,
                        22
                    ],
                    "text": "+ 500",
                    "varname": "s2_len_plus"
                }
            },
            {
                "box": {
                    "id": "s2_transform",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        2667,
                        105,
                        22
                    ],
                    "text": "r ctl_transform",
                    "varname": "s2_transform"
                }
            },
            {
                "box": {
                    "id": "s2_len_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        794,
                        2667,
                        165,
                        22
                    ],
                    "text": "scale 0. 1. 750. 45.",
                    "varname": "s2_len_scale"
                }
            },
            {
                "box": {
                    "id": "s2_len_int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        997,
                        2667,
                        30,
                        22
                    ],
                    "text": "i",
                    "varname": "s2_len_int"
                }
            },
            {
                "box": {
                    "id": "s2_duration",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        2737,
                        125,
                        22
                    ],
                    "text": "r rec_duration_ms",
                    "varname": "s2_duration"
                }
            },
            {
                "box": {
                    "id": "s2_duration_scale",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        816,
                        2737,
                        60,
                        22
                    ],
                    "text": "* 0.85",
                    "varname": "s2_duration_scale"
                }
            },
            {
                "box": {
                    "id": "s2_duration_int",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        904,
                        2737,
                        30,
                        22
                    ],
                    "text": "i",
                    "varname": "s2_duration_int"
                }
            },
            {
                "box": {
                    "id": "s2_duration_min",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        959,
                        2737,
                        95,
                        22
                    ],
                    "text": "maximum 500",
                    "varname": "s2_duration_min"
                }
            },
            {
                "box": {
                    "id": "s2_rand_start",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        2807,
                        90,
                        22
                    ],
                    "text": "random 9000",
                    "varname": "s2_rand_start"
                }
            },
            {
                "box": {
                    "id": "s2_start_len",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        777,
                        2807,
                        85,
                        22
                    ],
                    "text": "pack 0 500",
                    "varname": "s2_start_len"
                }
            },
            {
                "box": {
                    "id": "s2_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        893,
                        2807,
                        50,
                        22
                    ],
                    "text": "t l l",
                    "varname": "s2_order"
                }
            },
            {
                "box": {
                    "id": "s2_calc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        1074,
                        2737,
                        90,
                        22
                    ],
                    "text": "unpack 0 0",
                    "varname": "s2_calc"
                }
            },
            {
                "box": {
                    "id": "s2_end",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        1195,
                        2737,
                        35,
                        22
                    ],
                    "text": "+",
                    "varname": "s2_end"
                }
            },
            {
                "box": {
                    "id": "s2_start_only",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        970,
                        2842,
                        90,
                        22
                    ],
                    "text": "unpack 0 0",
                    "varname": "s2_start_only"
                }
            },
            {
                "box": {
                    "id": "s2_start_end",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1135,
                        2807,
                        75,
                        22
                    ],
                    "text": "pack 0 0 0",
                    "varname": "s2_start_end"
                }
            },
            {
                "box": {
                    "id": "s2_prepend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1239,
                        2807,
                        95,
                        22
                    ],
                    "text": "prepend grain",
                    "varname": "s2_prepend"
                }
            },
            {
                "box": {
                    "id": "s2_player",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1366,
                        2807,
                        204,
                        22
                    ],
                    "text": "poly~ Nostos_GrainVoice 4 @steal 1",
                    "varname": "s2_grain_poly"
                }
            },
            {
                "box": {
                    "id": "s2_cut_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1333,
                        2597,
                        155,
                        22
                    ],
                    "text": "scale 0. 1. 7000. 650.",
                    "varname": "s2_cut_scale"
                }
            },
            {
                "box": {
                    "id": "s2_cut_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1525,
                        2597,
                        80,
                        22
                    ],
                    "text": "pack 0. 80",
                    "varname": "s2_cut_pack"
                }
            },
            {
                "box": {
                    "id": "s2_cut_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1635,
                        2597,
                        80,
                        22
                    ],
                    "text": "line~ 6500.",
                    "varname": "s2_cut_line"
                }
            },
            {
                "box": {
                    "id": "s2_filter",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1546,
                        2769,
                        135,
                        22
                    ],
                    "text": "lores~ 6500. 0.45",
                    "varname": "s2_filter"
                }
            },
            {
                "box": {
                    "id": "s2_slice_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1707,
                        2807,
                        60,
                        22
                    ],
                    "text": "*~ 0.55",
                    "varname": "s2_slice_level"
                }
            },
            {
                "box": {
                    "id": "s2_event_b",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1239,
                        2667,
                        95,
                        22
                    ],
                    "text": "r ctl_event_b",
                    "varname": "s2_event_b"
                }
            },
            {
                "box": {
                    "id": "s2_recall",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1366,
                        2667,
                        90,
                        22
                    ],
                    "text": "start 0 1800",
                    "varname": "s2_recall"
                }
            },
            {
                "box": {
                    "id": "s2_recall_player",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1487,
                        2667,
                        130,
                        22
                    ],
                    "text": "play~ nostos_voice",
                    "varname": "s2_recall_player"
                }
            },
            {
                "box": {
                    "id": "s2_recall_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1652,
                        2667,
                        60,
                        22
                    ],
                    "text": "*~ 0.28",
                    "varname": "s2_recall_level"
                }
            },
            {
                "box": {
                    "id": "s2_hold",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1239,
                        2737,
                        80,
                        22
                    ],
                    "text": "r ctl_hold",
                    "varname": "s2_hold"
                }
            },
            {
                "box": {
                    "id": "s2_hold_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1349,
                        2737,
                        65,
                        22
                    ],
                    "text": "sel 1 0",
                    "varname": "s2_hold_sel"
                }
            },
            {
                "box": {
                    "id": "s2_hold_start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1443,
                        2860,
                        65,
                        22
                    ],
                    "text": "startloop",
                    "varname": "s2_hold_start"
                }
            },
            {
                "box": {
                    "id": "s2_hold_stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1443,
                        2920,
                        42,
                        22
                    ],
                    "text": "stop",
                    "varname": "s2_hold_stop"
                }
            },
            {
                "box": {
                    "id": "s2_hold_speed",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1536,
                        2720,
                        65,
                        22
                    ],
                    "text": "sig~ 0.75",
                    "varname": "s2_hold_speed"
                }
            },
            {
                "box": {
                    "id": "s2_hold_zero",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1630,
                        2860,
                        90,
                        22
                    ],
                    "text": "loadmess 0.",
                    "varname": "s2_hold_zero"
                }
            },
            {
                "box": {
                    "id": "s2_hold_end",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1630,
                        2920,
                        95,
                        22
                    ],
                    "text": "loadmess 700.",
                    "varname": "s2_hold_end"
                }
            },
            {
                "box": {
                    "id": "s2_hold_player",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "signal"
                    ],
                    "patching_rect": [
                        1756,
                        2737,
                        210,
                        22
                    ],
                    "text": "groove~ nostos_voice 1 @loop 1",
                    "varname": "s2_hold_player"
                }
            },
            {
                "box": {
                    "id": "s2_hold_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        2009,
                        2737,
                        60,
                        22
                    ],
                    "text": "*~ 0.18",
                    "varname": "s2_hold_level"
                }
            },
            {
                "box": {
                    "id": "s2_add_a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1800,
                        2885,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_add_a"
                }
            },
            {
                "box": {
                    "id": "s2_add_b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1877,
                        2885,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_add_b"
                }
            },
            {
                "box": {
                    "id": "s2_voice",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1954,
                        2885,
                        90,
                        22
                    ],
                    "text": "r ctl_voice",
                    "varname": "s2_voice"
                }
            },
            {
                "box": {
                    "id": "s2_voice_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        2075,
                        2885,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s2_voice_pack"
                }
            },
            {
                "box": {
                    "id": "s2_voice_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        2191,
                        2885,
                        70,
                        22
                    ],
                    "text": "line~ 0.75",
                    "varname": "s2_voice_line"
                }
            },
            {
                "box": {
                    "id": "s2_voice_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1954,
                        2965,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_voice_gain"
                }
            },
            {
                "box": {
                    "id": "s2_bed_user_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        365,
                        2982,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_bed_user_gain"
                }
            },
            {
                "box": {
                    "id": "s2_bed_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        3052,
                        80,
                        22
                    ],
                    "text": "r ctl_bed",
                    "varname": "s2_bed_receive"
                }
            },
            {
                "box": {
                    "id": "s2_bed_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        3052,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s2_bed_pack"
                }
            },
            {
                "box": {
                    "id": "s2_bed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        271,
                        3052,
                        70,
                        22
                    ],
                    "text": "line~ 0.5",
                    "varname": "s2_bed_line"
                }
            },
            {
                "box": {
                    "id": "s2_mix_l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        711,
                        2939,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_mix_l"
                }
            },
            {
                "box": {
                    "id": "s2_mix_r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        788,
                        2939,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_mix_r"
                }
            },
            {
                "box": {
                    "id": "s2_gain_cmd",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        876,
                        2982,
                        105,
                        22
                    ],
                    "text": "r s2_gain_cmd",
                    "varname": "s2_gain_cmd"
                }
            },
            {
                "box": {
                    "id": "s2_gain_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1014,
                        2982,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s2_gain_line"
                }
            },
            {
                "box": {
                    "id": "s2_gain_l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1107,
                        2939,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_gain_l"
                }
            },
            {
                "box": {
                    "id": "s2_gain_r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1107,
                        3009,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_gain_r"
                }
            },
            {
                "box": {
                    "id": "s2_send_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1184,
                        2920,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s2_l",
                    "varname": "s2_send_l"
                }
            },
            {
                "box": {
                    "id": "s2_send_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1184,
                        3009,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s2_r",
                    "varname": "s2_send_r"
                }
            },
            {
                "box": {
                    "id": "s2_meter_l",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1366,
                        2920,
                        18,
                        80
                    ],
                    "varname": "s2_meter_l"
                }
            },
            {
                "box": {
                    "id": "s2_meter_r",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1399,
                        2920,
                        18,
                        80
                    ],
                    "varname": "s2_meter_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_s2_chain",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1320,
                        3035,
                        730,
                        22
                    ],
                    "text": "四声部语音粒子与金属BED独立；AUTO VOICE只管人声粒子，BED PARTICLE触发金属碎屑爆裂。",
                    "varname": "label_s2_chain"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_s3_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3760,
                        1200,
                        34
                    ],
                    "text": "5｜第三阶段：重组／归返",
                    "textcolor": [
                        0.15,
                        0.65,
                        0.4,
                        1
                    ],
                    "varname": "label_s3_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_s3_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3827,
                        1350,
                        25
                    ],
                    "text": "从左到右阅读：场景与事件 → TRANSFORM速度／滤波映射 → 语音播放与VOICE → 场景输出；下半区是呼吸、风沙与BED PARTICLE。",
                    "varname": "label_s3_help"
                }
            },
            {
                "box": {
                    "id": "s3_scene",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        3942,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "s3_scene"
                }
            },
            {
                "box": {
                    "id": "s3_equal",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        178,
                        3942,
                        45,
                        22
                    ],
                    "text": "== 3",
                    "varname": "s3_equal"
                }
            },
            {
                "box": {
                    "id": "s3_change",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        249,
                        3942,
                        55,
                        22
                    ],
                    "text": "change",
                    "varname": "s3_change"
                }
            },
            {
                "box": {
                    "id": "s3_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        332,
                        3942,
                        65,
                        22
                    ],
                    "text": "sel 1 0",
                    "varname": "s3_sel"
                }
            },
            {
                "box": {
                    "id": "s3_start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        425,
                        3915,
                        65,
                        22
                    ],
                    "text": "startloop",
                    "varname": "s3_start"
                }
            },
            {
                "box": {
                    "id": "s3_stop_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        425,
                        3988,
                        75,
                        22
                    ],
                    "text": "delay 520",
                    "varname": "s3_stop_delay"
                }
            },
            {
                "box": {
                    "id": "s3_stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        530,
                        3988,
                        42,
                        22
                    ],
                    "text": "stop",
                    "varname": "s3_stop"
                }
            },
            {
                "box": {
                    "id": "s3_transform",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        3915,
                        105,
                        22
                    ],
                    "text": "r ctl_transform",
                    "varname": "s3_transform"
                }
            },
            {
                "box": {
                    "id": "s3_speed_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        794,
                        3915,
                        145,
                        22
                    ],
                    "text": "scale 0. 1. 1. 0.65",
                    "varname": "s3_speed_scale"
                }
            },
            {
                "box": {
                    "id": "s3_speed_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        975,
                        3915,
                        90,
                        22
                    ],
                    "text": "pack 0. 100",
                    "varname": "s3_speed_pack"
                }
            },
            {
                "box": {
                    "id": "s3_speed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1096,
                        3915,
                        60,
                        22
                    ],
                    "text": "line~ 1.",
                    "varname": "s3_speed_line"
                }
            },
            {
                "box": {
                    "id": "s3_cut_scale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        794,
                        3988,
                        165,
                        22
                    ],
                    "text": "scale 0. 1. 6000. 350.",
                    "varname": "s3_cut_scale"
                }
            },
            {
                "box": {
                    "id": "s3_cut_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        997,
                        3988,
                        90,
                        22
                    ],
                    "text": "pack 0. 100",
                    "varname": "s3_cut_pack"
                }
            },
            {
                "box": {
                    "id": "s3_cut_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1118,
                        3988,
                        80,
                        22
                    ],
                    "text": "line~ 6000.",
                    "varname": "s3_cut_line"
                }
            },
            {
                "box": {
                    "id": "s3_duration",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        4069,
                        125,
                        22
                    ],
                    "text": "r rec_duration_ms",
                    "varname": "s3_duration"
                }
            },
            {
                "box": {
                    "id": "s3_zero",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        816,
                        4069,
                        90,
                        22
                    ],
                    "text": "loadmess 0.",
                    "varname": "s3_zero"
                }
            },
            {
                "box": {
                    "id": "s3_player",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "signal"
                    ],
                    "patching_rect": [
                        1096,
                        4142,
                        210,
                        22
                    ],
                    "text": "groove~ nostos_voice 1 @loop 1",
                    "varname": "s3_player"
                }
            },
            {
                "box": {
                    "id": "s3_filter",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1360,
                        4142,
                        125,
                        22
                    ],
                    "text": "lores~ 6000. 0.4",
                    "varname": "s3_filter"
                }
            },
            {
                "box": {
                    "id": "s3_static",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1525,
                        4142,
                        60,
                        22
                    ],
                    "text": "*~ 0.5",
                    "varname": "s3_static"
                }
            },
            {
                "box": {
                    "id": "s3_voice",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1360,
                        3915,
                        90,
                        22
                    ],
                    "text": "r ctl_voice",
                    "varname": "s3_voice"
                }
            },
            {
                "box": {
                    "id": "s3_voice_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1481,
                        3915,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s3_voice_pack"
                }
            },
            {
                "box": {
                    "id": "s3_voice_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1597,
                        3915,
                        70,
                        22
                    ],
                    "text": "line~ 0.75",
                    "varname": "s3_voice_line"
                }
            },
            {
                "box": {
                    "id": "s3_voice_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1624,
                        4142,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_voice_gain"
                }
            },
            {
                "box": {
                    "id": "s3_auto_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1679,
                        4142,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_auto_gain"
                }
            },
            {
                "box": {
                    "id": "s3_auto_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        4197,
                        105,
                        22
                    ],
                    "text": "r ctl_auto_voice",
                    "varname": "s3_auto_receive"
                }
            },
            {
                "box": {
                    "id": "s3_auto_store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        794,
                        4197,
                        45,
                        22
                    ],
                    "text": "f 1.",
                    "varname": "s3_auto_store"
                }
            },
            {
                "box": {
                    "id": "s3_auto_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        865,
                        4197,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s3_auto_pack"
                }
            },
            {
                "box": {
                    "id": "s3_auto_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        981,
                        4197,
                        70,
                        22
                    ],
                    "text": "line~ 1.",
                    "varname": "s3_auto_line"
                }
            },
            {
                "box": {
                    "id": "s3_auto_event_on",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        656,
                        4270,
                        55,
                        22
                    ],
                    "text": "1. 20",
                    "varname": "s3_auto_event_on"
                }
            },
            {
                "box": {
                    "id": "s3_auto_event_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        739,
                        4270,
                        80,
                        22
                    ],
                    "text": "delay 3100",
                    "varname": "s3_auto_event_delay"
                }
            },
            {
                "box": {
                    "id": "s3_auto_on_select",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        865,
                        4270,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "s3_auto_on_select"
                }
            },
            {
                "box": {
                    "id": "s3_auto_restart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        937,
                        4270,
                        65,
                        22
                    ],
                    "text": "startloop",
                    "varname": "s3_auto_restart"
                }
            },
            {
                "box": {
                    "id": "s3_event_a",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1360,
                        3997,
                        95,
                        22
                    ],
                    "text": "r ctl_event_a",
                    "varname": "s3_event_a"
                }
            },
            {
                "box": {
                    "id": "s3_oracle",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1487,
                        3997,
                        125,
                        22
                    ],
                    "text": "350., 5200. 3000",
                    "varname": "s3_oracle"
                }
            },
            {
                "box": {
                    "id": "s3_event_b",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1360,
                        4069,
                        95,
                        22
                    ],
                    "text": "r ctl_event_b",
                    "varname": "s3_event_b"
                }
            },
            {
                "box": {
                    "id": "s3_recall",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1487,
                        4069,
                        90,
                        22
                    ],
                    "text": "start 0 1800",
                    "varname": "s3_recall"
                }
            },
            {
                "box": {
                    "id": "s3_recall_player",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1613,
                        4069,
                        130,
                        22
                    ],
                    "text": "play~ nostos_voice",
                    "varname": "s3_recall_player"
                }
            },
            {
                "box": {
                    "id": "s3_recall_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1778,
                        4069,
                        60,
                        22
                    ],
                    "text": "*~ 0.25",
                    "varname": "s3_recall_level"
                }
            },
            {
                "box": {
                    "id": "s3_voice_mix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1734,
                        4142,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_voice_mix"
                }
            },
            {
                "box": {
                    "id": "s3_bed_a",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        161,
                        4197,
                        90,
                        22
                    ],
                    "text": "cycle~ 73.42",
                    "varname": "s3_bed_a"
                }
            },
            {
                "box": {
                    "id": "s3_bed_b",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        282,
                        4197,
                        85,
                        22
                    ],
                    "text": "cycle~ 110.35",
                    "varname": "s3_bed_b"
                }
            },
            {
                "box": {
                    "id": "s3_bed_a_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        403,
                        4170,
                        60,
                        22
                    ],
                    "text": "*~ 0.04",
                    "varname": "s3_bed_a_level"
                }
            },
            {
                "box": {
                    "id": "s3_bed_b_level",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        403,
                        4243,
                        60,
                        22
                    ],
                    "text": "*~ 0.02",
                    "varname": "s3_bed_b_level"
                }
            },
            {
                "box": {
                    "id": "s3_bed_mix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        497,
                        4207,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_bed_mix"
                }
            },
            {
                "box": {
                    "id": "s3_bed_user_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        568,
                        4207,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_bed_user_gain"
                }
            },
            {
                "box": {
                    "id": "s3_bed_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        4306,
                        80,
                        22
                    ],
                    "text": "r ctl_bed",
                    "varname": "s3_bed_receive"
                }
            },
            {
                "box": {
                    "id": "s3_bed_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        4306,
                        85,
                        22
                    ],
                    "text": "pack 0. 50",
                    "varname": "s3_bed_pack"
                }
            },
            {
                "box": {
                    "id": "s3_bed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        271,
                        4306,
                        70,
                        22
                    ],
                    "text": "line~ 0.5",
                    "varname": "s3_bed_line"
                }
            },
            {
                "box": {
                    "id": "s3_mix",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1866,
                        4233,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_mix"
                }
            },
            {
                "box": {
                    "id": "s3_gain_cmd",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1943,
                        4097,
                        105,
                        22
                    ],
                    "text": "r s3_gain_cmd",
                    "varname": "s3_gain_cmd"
                }
            },
            {
                "box": {
                    "id": "s3_gain_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        2081,
                        4097,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s3_gain_line"
                }
            },
            {
                "box": {
                    "id": "s3_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1943,
                        4233,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_gain"
                }
            },
            {
                "box": {
                    "id": "s3_send_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        2031,
                        4207,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s3_l",
                    "varname": "s3_send_l"
                }
            },
            {
                "box": {
                    "id": "s3_send_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        2031,
                        4279,
                        140,
                        22
                    ],
                    "text": "send~ nostos_s3_r",
                    "varname": "s3_send_r"
                }
            },
            {
                "box": {
                    "id": "s3_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        2218,
                        4188,
                        18,
                        80
                    ],
                    "varname": "s3_meter"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_s3_chain",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        4370,
                        850,
                        22
                    ],
                    "text": "归返坐标由低音拍频、风沙与残余噪声组成；BED PARTICLE触发沙浪，RETURN不受AUTO VOICE限制。",
                    "varname": "label_s3_chain"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20,
                    "id": "label_output_section",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4920,
                        1200,
                        34
                    ],
                    "text": "6｜统一混音、安全输出与紧急静音",
                    "textcolor": [
                        0.15,
                        0.55,
                        0.55,
                        1
                    ],
                    "varname": "label_output_section"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 13,
                    "id": "label_output_help",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4978,
                        1450,
                        25
                    ],
                    "text": "所有声音只从这里进入扬声器：接收 → 相加 → MASTER → clip~ → 20 ms MUTE 斜坡 → meter~ → ezdac~。异常时立即按 MUTE。",
                    "varname": "label_output_help"
                }
            },
            {
                "box": {
                    "id": "out_original_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        5076,
                        170,
                        22
                    ],
                    "text": "receive~ nostos_original_l",
                    "varname": "out_original_l"
                }
            },
            {
                "box": {
                    "id": "out_original_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        500,
                        5076,
                        170,
                        22
                    ],
                    "text": "receive~ nostos_original_r",
                    "varname": "out_original_r"
                }
            },
            {
                "box": {
                    "id": "out_s1_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        5139,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s1_l",
                    "varname": "out_s1_l"
                }
            },
            {
                "box": {
                    "id": "out_s1_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        500,
                        5139,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s1_r",
                    "varname": "out_s1_r"
                }
            },
            {
                "box": {
                    "id": "out_s2_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        5201,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s2_l",
                    "varname": "out_s2_l"
                }
            },
            {
                "box": {
                    "id": "out_s2_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        500,
                        5201,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s2_r",
                    "varname": "out_s2_r"
                }
            },
            {
                "box": {
                    "id": "out_s3_l",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        5264,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s3_l",
                    "varname": "out_s3_l"
                }
            },
            {
                "box": {
                    "id": "out_s3_r",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        500,
                        5264,
                        150,
                        22
                    ],
                    "text": "receive~ nostos_s3_r",
                    "varname": "out_s3_r"
                }
            },
            {
                "box": {
                    "id": "out_l_add1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        235,
                        5108,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_l_add1"
                }
            },
            {
                "box": {
                    "id": "out_l_add2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        305,
                        5170,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_l_add2"
                }
            },
            {
                "box": {
                    "id": "out_l_add3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        375,
                        5233,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_l_add3"
                }
            },
            {
                "box": {
                    "id": "out_r_add1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        695,
                        5108,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_r_add1"
                }
            },
            {
                "box": {
                    "id": "out_r_add2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        765,
                        5170,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_r_add2"
                }
            },
            {
                "box": {
                    "id": "out_r_add3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        835,
                        5233,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "out_r_add3"
                }
            },
            {
                "box": {
                    "id": "out_master",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        "float",
                        "list"
                    ],
                    "parameter_enable": 1,
                    "patching_rect": [
                        950,
                        5061,
                        52,
                        150
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1180,
                        250,
                        55,
                        180
                    ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                -12
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "Nostos Master",
                            "parameter_mmax": 6,
                            "parameter_mmin": -70,
                            "parameter_modmode": 0,
                            "parameter_shortname": "MASTER",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "out_master"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "out_master_default",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1025,
                        5061,
                        235,
                        25
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1140,
                        215,
                        222,
                        25
                    ],
                    "text": "控: MASTER 总音量（默认 -12 dB）",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "out_master_default"
                }
            },
            {
                "box": {
                    "id": "master_remote_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1025,
                        5264,
                        120,
                        22
                    ],
                    "text": "r ctl_master_db",
                    "varname": "master_remote_receive"
                }
            },
            {
                "box": {
                    "id": "out_clip_l",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1120,
                        5108,
                        100,
                        22
                    ],
                    "text": "clip~ -0.9 0.9",
                    "varname": "out_clip_l"
                }
            },
            {
                "box": {
                    "id": "out_clip_r",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1120,
                        5186,
                        100,
                        22
                    ],
                    "text": "clip~ -0.9 0.9",
                    "varname": "out_clip_r"
                }
            },
            {
                "box": {
                    "id": "ui_mute",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        1280,
                        5061,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1170,
                        80,
                        60,
                        60
                    ],
                    "varname": "ui_mute"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "label_mute",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1340,
                        5061,
                        165,
                        42
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        1240,
                        85,
                        165,
                        42
                    ],
                    "text": "控: EMERGENCY MUTE\n1=静音",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_mute"
                }
            },
            {
                "box": {
                    "id": "out_mute_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1280,
                        5155,
                        80,
                        22
                    ],
                    "text": "s ctl_mute",
                    "varname": "out_mute_send"
                }
            },
            {
                "box": {
                    "id": "mute_bottom_state_set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1380,
                        5155,
                        85,
                        22
                    ],
                    "text": "prepend set",
                    "varname": "mute_bottom_state_set"
                }
            },
            {
                "box": {
                    "id": "out_mute_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1280,
                        5218,
                        80,
                        22
                    ],
                    "text": "r ctl_mute",
                    "varname": "out_mute_receive"
                }
            },
            {
                "box": {
                    "id": "out_invert",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        1380,
                        5218,
                        45,
                        22
                    ],
                    "text": "!- 1",
                    "varname": "out_invert"
                }
            },
            {
                "box": {
                    "id": "out_mute_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1450,
                        5218,
                        75,
                        22
                    ],
                    "text": "pack 0 20",
                    "varname": "out_mute_pack"
                }
            },
            {
                "box": {
                    "id": "out_mute_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1545,
                        5218,
                        60,
                        22
                    ],
                    "text": "line~ 1.",
                    "varname": "out_mute_line"
                }
            },
            {
                "box": {
                    "id": "out_gain_l",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1260,
                        5326,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "out_gain_l"
                }
            },
            {
                "box": {
                    "id": "out_gain_r",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1260,
                        5405,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "out_gain_r"
                }
            },
            {
                "box": {
                    "id": "out_meter_l",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1340,
                        5295,
                        18,
                        80
                    ],
                    "varname": "out_meter_l"
                }
            },
            {
                "box": {
                    "id": "out_meter_r",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        1380,
                        5295,
                        18,
                        80
                    ],
                    "varname": "out_meter_r"
                }
            },
            {
                "box": {
                    "id": "out_dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        1480,
                        5319,
                        55,
                        55
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1280,
                        360,
                        60,
                        60
                    ],
                    "varname": "out_dac"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_dsp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1450,
                        5436,
                        260,
                        25
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        1240,
                        435,
                        280,
                        25
                    ],
                    "text": "控: 点击扬声器开启／关闭 DSP",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_dsp"
                }
            },
            {
                "box": {
                    "id": "out_mute_default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1280,
                        5514,
                        90,
                        22
                    ],
                    "text": "loadmess 0",
                    "varname": "out_mute_default"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-1",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1344,
                        1834,
                        145,
                        22
                    ],
                    "text": "scale 0. 1. 0. 1.4",
                    "varname": "s1_voice_scale"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-2",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1954,
                        2815,
                        145,
                        22
                    ],
                    "text": "scale 0. 1. 0. 1.4",
                    "varname": "s2_voice_scale"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-3",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1701,
                        3915,
                        145,
                        22
                    ],
                    "text": "scale 0. 1. 0. 1.4",
                    "varname": "s3_voice_scale"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-4",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [
                        "int",
                        "",
                        "",
                        "int"
                    ],
                    "patching_rect": [
                        557,
                        2755,
                        80,
                        22
                    ],
                    "text": "counter 1 4",
                    "varname": "s2_grain_voice_counter"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        535,
                        2807,
                        95,
                        22
                    ],
                    "text": "prepend target",
                    "varname": "s2_grain_target"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        2825,
                        35,
                        22
                    ],
                    "text": "1",
                    "varname": "s2_burst_start"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        101,
                        2825,
                        70,
                        22
                    ],
                    "text": "metro 90",
                    "varname": "s2_burst_metro"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        200,
                        2825,
                        80,
                        22
                    ],
                    "text": "delay 1200",
                    "varname": "s2_burst_delay"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        310,
                        2825,
                        35,
                        22
                    ],
                    "text": "0",
                    "varname": "s2_burst_stop"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-10",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1195,
                        2597,
                        105,
                        22
                    ],
                    "text": "r ctl_transform",
                    "varname": "s2_grain_cut_transform"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3262,
                        780,
                        23
                    ],
                    "text": "破碎金属BED：两组不同周期的短脉冲激发1370/2390 Hz共振；DENSITY越高，金属碎片越密。",
                    "varname": "label_s2_bed_motion"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-19",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        4415,
                        90,
                        22
                    ],
                    "text": "r ctl_density",
                    "varname": "s3_density"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-20",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        4415,
                        155,
                        22
                    ],
                    "text": "scale 0. 1. 0.05 2.5",
                    "varname": "s3_breath_rate_scale"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-21",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        354,
                        4415,
                        90,
                        22
                    ],
                    "text": "pack 0. 200",
                    "varname": "s3_breath_rate_pack"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        475,
                        4415,
                        70,
                        22
                    ],
                    "text": "line~ 0.3",
                    "varname": "s3_breath_rate_line"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-23",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        574,
                        4415,
                        50,
                        22
                    ],
                    "text": "cycle~",
                    "varname": "s3_breath_lfo"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        651,
                        4415,
                        65,
                        22
                    ],
                    "text": "*~ 0.28",
                    "varname": "s3_breath_depth"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-25",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        744,
                        4415,
                        70,
                        22
                    ],
                    "text": "+~ 0.72",
                    "varname": "s3_breath_offset"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-26",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        766,
                        4342,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_tone_breath_gain"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        953,
                        4415,
                        55,
                        22
                    ],
                    "text": "noise~",
                    "varname": "s3_residual_noise"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-28",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1036,
                        4415,
                        130,
                        22
                    ],
                    "text": "lores~ 1400. 0.55",
                    "varname": "s3_residual_filter"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-29",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1201,
                        4415,
                        165,
                        22
                    ],
                    "text": "scale 0. 1. 0.005 0.08",
                    "varname": "s3_residual_transform_scale"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1404,
                        4415,
                        90,
                        22
                    ],
                    "text": "pack 0. 150",
                    "varname": "s3_residual_pack"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-31",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1525,
                        4415,
                        75,
                        22
                    ],
                    "text": "line~ 0.02",
                    "varname": "s3_residual_line"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1201,
                        4270,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_residual_gain"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-33",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1294,
                        4270,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_bed_add_residual"
                }
            },
            {
                "box": {
                    "id": "obj-revision-a-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4506,
                        760,
                        23
                    ],
                    "text": "风沙BED：宽频噪声缓慢起伏；73.42/110.35 Hz低音提供归返坐标，TRANSFORM降低时残余摩擦退去。",
                    "varname": "label_s3_bed_motion"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-ui",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        280,
                        980,
                        44,
                        44
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        290,
                        300,
                        60,
                        60
                    ],
                    "varname": "ui_bed_particle"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        400,
                        1086,
                        125,
                        22
                    ],
                    "text": "s ctl_bed_particle",
                    "varname": "bed_particle_send"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        3385,
                        120,
                        22
                    ],
                    "text": "r ctl_bed_particle",
                    "varname": "s2_bed_particle_receive"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        194,
                        3359,
                        365,
                        22
                    ],
                    "text": "0., 1. 2 0. 35 0.85 2 0. 55 0.7 2 0. 90 0.55 2 0. 180",
                    "varname": "s2_bed_particle_spray_envelope"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        194,
                        3499,
                        130,
                        22
                    ],
                    "text": "0., 0.75 4 0. 420",
                    "varname": "s2_bed_particle_low_envelope_message"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        623,
                        3385,
                        55,
                        22
                    ],
                    "text": "noise~",
                    "varname": "s2_bed_particle_noise"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-8",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        711,
                        3359,
                        130,
                        22
                    ],
                    "text": "reson~ 0.28 3200. 18.",
                    "varname": "s2_bed_particle_high_filter"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        623,
                        3455,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s2_bed_particle_high_envelope"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        882,
                        3359,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_bed_particle_high_gain"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        948,
                        3359,
                        65,
                        22
                    ],
                    "text": "*~ 0.18",
                    "varname": "s2_bed_particle_high_level"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-12",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        711,
                        3507,
                        120,
                        22
                    ],
                    "text": "reson~ 0.24 780. 12.",
                    "varname": "s2_bed_particle_low_filter"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        623,
                        3569,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s2_bed_particle_low_envelope"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        871,
                        3507,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s2_bed_particle_low_gain"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        937,
                        3507,
                        65,
                        22
                    ],
                    "text": "*~ 0.14",
                    "varname": "s2_bed_particle_low_level"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1052,
                        3437,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_bed_particle_event_mix"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1140,
                        3437,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_bed_sum"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-18",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1228,
                        3385,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "s2_bed_particle_reset_receive"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-19",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1344,
                        3385,
                        48,
                        22
                    ],
                    "text": "stop, 0.",
                    "varname": "s2_bed_particle_reset_zero"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3647,
                        900,
                        23
                    ],
                    "text": "Stage 2 BED PARTICLE：约0.5秒的多次金属碎屑爆裂；不读取录音，可在纯背景段点两下。",
                    "varname": "label_s2_bed_particle"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-21",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        2090,
                        5822,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "osc_bed_particle_select"
                }
            },
            {
                "box": {
                    "id": "obj-bed-particle-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        2155,
                        5822,
                        125,
                        22
                    ],
                    "text": "s ctl_bed_particle",
                    "varname": "osc_bed_particle_send"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 14,
                    "id": "obj-bed-particle-label",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        295,
                        930,
                        77,
                        40
                    ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [
                        270,
                        260,
                        77,
                        40
                    ],
                    "text": "控: BED\nPARTICLE",
                    "textcolor": [
                        0.65,
                        0.2,
                        0.85,
                        1
                    ],
                    "varname": "label_bed_particle_event"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        3140,
                        90,
                        22
                    ],
                    "text": "r ctl_density",
                    "varname": "s2_metal_density"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-2",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        161,
                        3140,
                        155,
                        22
                    ],
                    "text": "scale 0. 1. 900. 110.",
                    "varname": "s2_metal_period_scale"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        354,
                        3140,
                        90,
                        22
                    ],
                    "text": "pack 0. 150",
                    "varname": "s2_metal_period_pack"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        475,
                        3140,
                        75,
                        22
                    ],
                    "text": "line~ 430.",
                    "varname": "s2_metal_period_line"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        585,
                        3140,
                        115,
                        22
                    ],
                    "text": "train~ 430. 0.012",
                    "varname": "s2_metal_train_a"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-6",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        739,
                        3140,
                        145,
                        22
                    ],
                    "text": "reson~ 0.32 1370. 10.",
                    "varname": "s2_metal_reson_a"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        585,
                        3210,
                        60,
                        22
                    ],
                    "text": "*~ 1.61",
                    "varname": "s2_metal_period_ratio"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-8",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        673,
                        3210,
                        115,
                        22
                    ],
                    "text": "train~ 690. 0.008",
                    "varname": "s2_metal_train_b"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-9",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        827,
                        3210,
                        145,
                        22
                    ],
                    "text": "reson~ 0.27 2390. 14.",
                    "varname": "s2_metal_reson_b"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1014,
                        3165,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s2_metal_add"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-11",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1080,
                        3165,
                        105,
                        22
                    ],
                    "text": "clip~ -0.45 0.45",
                    "varname": "s2_metal_clip"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1223,
                        3165,
                        65,
                        22
                    ],
                    "text": "*~ 0.55",
                    "varname": "s2_metal_level"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40,
                        4615,
                        55,
                        22
                    ],
                    "text": "noise~",
                    "varname": "s3_sand_noise"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-14",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        123,
                        4615,
                        130,
                        22
                    ],
                    "text": "lores~ 4800. 0.25",
                    "varname": "s3_sand_filter"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        293,
                        4615,
                        85,
                        22
                    ],
                    "text": "cycle~ 0.17",
                    "varname": "s3_sand_lfo"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        409,
                        4615,
                        65,
                        22
                    ],
                    "text": "*~ 0.22",
                    "varname": "s3_sand_depth"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        502,
                        4615,
                        70,
                        22
                    ],
                    "text": "+~ 0.78",
                    "varname": "s3_sand_offset"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        607,
                        4615,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_sand_gain"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-19",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        673,
                        4615,
                        70,
                        22
                    ],
                    "text": "*~ 0.045",
                    "varname": "s3_sand_level"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        788,
                        4561,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_bed_add_sand"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-21",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        931,
                        4615,
                        120,
                        22
                    ],
                    "text": "r ctl_bed_particle",
                    "varname": "s3_bed_particle_receive"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1085,
                        4579,
                        255,
                        22
                    ],
                    "text": "0., 0.75 70 0.45 380 0.7 120 0. 900",
                    "varname": "s3_bed_particle_envelope_message"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1085,
                        4652,
                        190,
                        22
                    ],
                    "text": "900., 5200. 500 1800. 900",
                    "varname": "s3_bed_particle_cutoff_message"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1393,
                        4615,
                        55,
                        22
                    ],
                    "text": "noise~",
                    "varname": "s3_bed_particle_noise"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-25",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1481,
                        4615,
                        125,
                        22
                    ],
                    "text": "lores~ 900. 0.35",
                    "varname": "s3_bed_particle_filter"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-26",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1316,
                        4716,
                        75,
                        22
                    ],
                    "text": "line~ 900.",
                    "varname": "s3_bed_particle_cutoff_line"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-27",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "signal",
                        "bang"
                    ],
                    "patching_rect": [
                        1481,
                        4716,
                        60,
                        22
                    ],
                    "text": "line~ 0.",
                    "varname": "s3_bed_particle_envelope"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-28",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1646,
                        4615,
                        35,
                        22
                    ],
                    "text": "*~",
                    "varname": "s3_bed_particle_gain"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1712,
                        4615,
                        65,
                        22
                    ],
                    "text": "*~ 0.18",
                    "varname": "s3_bed_particle_level"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-30",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        1811,
                        4561,
                        35,
                        22
                    ],
                    "text": "+~",
                    "varname": "s3_bed_total"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-31",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1877,
                        4680,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "s3_bed_particle_reset_receive"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1993,
                        4680,
                        65,
                        22
                    ],
                    "text": "stop, 0.",
                    "varname": "s3_bed_particle_reset"
                }
            },
            {
                "box": {
                    "id": "obj-distinct-bed-33",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        4797,
                        710,
                        23
                    ],
                    "text": "Stage 3 BED PARTICLE：约1.5秒的风沙浪掠过；同一按钮在Stage 2是短金属爆裂。",
                    "varname": "label_s3_bed_particle"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16,
                    "id": "label_performance_timer",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        850,
                        1320,
                        285,
                        29
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        760,
                        140,
                        250,
                        29
                    ],
                    "text": "演出计时（STAGE 1 开始）",
                    "varname": "label_performance_timer"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 24,
                    "id": "ui_performance_timer",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        850,
                        1350,
                        120,
                        35
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        760,
                        170,
                        250,
                        35
                    ],
                    "text": "00:00",
                    "textjustification": 1,
                    "varname": "ui_performance_timer"
                }
            },
            {
                "box": {
                    "id": "timer_scene_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        990,
                        1350,
                        105,
                        22
                    ],
                    "text": "r nostos_scene",
                    "varname": "timer_scene_receive"
                }
            },
            {
                "box": {
                    "id": "timer_scene_select",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1110,
                        1350,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "timer_scene_select"
                }
            },
            {
                "box": {
                    "id": "timer_start_trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "bang",
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        1170,
                        1350,
                        55,
                        22
                    ],
                    "text": "t b b b",
                    "varname": "timer_start_trigger"
                }
            },
            {
                "box": {
                    "id": "timer_start_display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1235,
                        1320,
                        85,
                        22
                    ],
                    "text": "set 00:00",
                    "varname": "timer_start_display"
                }
            },
            {
                "box": {
                    "id": "timer_start_toggle",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1235,
                        1350,
                        35,
                        22
                    ],
                    "text": "1",
                    "varname": "timer_start_toggle"
                }
            },
            {
                "box": {
                    "id": "timer_clock",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        1285,
                        1350,
                        85,
                        22
                    ],
                    "text": "qmetro 100",
                    "varname": "timer_clock"
                }
            },
            {
                "box": {
                    "id": "timer_elapsed",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "float",
                        ""
                    ],
                    "patching_rect": [
                        1385,
                        1350,
                        45,
                        22
                    ],
                    "text": "timer",
                    "varname": "timer_elapsed"
                }
            },
            {
                "box": {
                    "id": "timer_seconds_total",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1445,
                        1350,
                        145,
                        22
                    ],
                    "text": "expr int($f1 / 1000.)",
                    "varname": "timer_seconds_total"
                }
            },
            {
                "box": {
                    "id": "timer_split_trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        1605,
                        1350,
                        45,
                        22
                    ],
                    "text": "t i i",
                    "varname": "timer_split_trigger"
                }
            },
            {
                "box": {
                    "id": "timer_minutes_divide",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        1665,
                        1335,
                        40,
                        22
                    ],
                    "text": "/ 60",
                    "varname": "timer_minutes_divide"
                }
            },
            {
                "box": {
                    "id": "timer_seconds_modulo",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        1665,
                        1365,
                        40,
                        22
                    ],
                    "text": "% 60",
                    "varname": "timer_seconds_modulo"
                }
            },
            {
                "box": {
                    "id": "timer_pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1725,
                        1350,
                        70,
                        22
                    ],
                    "text": "pack 0 0",
                    "varname": "timer_pack"
                }
            },
            {
                "box": {
                    "id": "timer_format",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1810,
                        1350,
                        130,
                        22
                    ],
                    "text": "sprintf %02ld:%02ld",
                    "varname": "timer_format"
                }
            },
            {
                "box": {
                    "id": "timer_display_set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1955,
                        1350,
                        85,
                        22
                    ],
                    "text": "prepend set",
                    "varname": "timer_display_set"
                }
            },
            {
                "box": {
                    "id": "timer_reset_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        990,
                        1410,
                        85,
                        22
                    ],
                    "text": "r ctl_reset",
                    "varname": "timer_reset_receive"
                }
            },
            {
                "box": {
                    "id": "timer_reset_trigger",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        1090,
                        1410,
                        45,
                        22
                    ],
                    "text": "t b b",
                    "varname": "timer_reset_trigger"
                }
            },
            {
                "box": {
                    "id": "timer_stop_toggle",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1150,
                        1410,
                        35,
                        22
                    ],
                    "text": "0",
                    "varname": "timer_stop_toggle"
                }
            },
            {
                "box": {
                    "id": "timer_reset_display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1200,
                        1410,
                        85,
                        22
                    ],
                    "text": "set 00:00",
                    "varname": "timer_reset_display"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s1_lane_1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1700,
                        300,
                        25
                    ],
                    "text": "① 场景／事件控制",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s1_lane_1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s1_lane_2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        1700,
                        300,
                        25
                    ],
                    "text": "② 参数映射／时间行为",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s1_lane_2"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s1_lane_3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        1700,
                        300,
                        25
                    ],
                    "text": "③ 声音生成／处理",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s1_lane_3"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s1_lane_4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1500,
                        1700,
                        300,
                        25
                    ],
                    "text": "④ 混合／场景输出",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s1_lane_4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s2_lane_1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2492,
                        300,
                        25
                    ],
                    "text": "① 场景／事件控制",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s2_lane_1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s2_lane_2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        2492,
                        300,
                        25
                    ],
                    "text": "② 参数映射／时间行为",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s2_lane_2"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s2_lane_3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        2492,
                        300,
                        25
                    ],
                    "text": "③ 声音生成／处理",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s2_lane_3"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s2_lane_4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1500,
                        2492,
                        300,
                        25
                    ],
                    "text": "④ 混合／场景输出",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s2_lane_4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s3_lane_1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3872,
                        300,
                        25
                    ],
                    "text": "① 场景／事件控制",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s3_lane_1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s3_lane_2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        500,
                        3872,
                        300,
                        25
                    ],
                    "text": "② 参数映射／时间行为",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s3_lane_2"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s3_lane_3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1000,
                        3872,
                        300,
                        25
                    ],
                    "text": "③ 声音生成／处理",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s3_lane_3"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 13,
                    "id": "label_s3_lane_4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1500,
                        3872,
                        300,
                        25
                    ],
                    "text": "④ 混合／场景输出",
                    "textcolor": [
                        0.2,
                        0.55,
                        0.9,
                        1
                    ],
                    "varname": "label_s3_lane_4"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_scene",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1756,
                        260,
                        20
                    ],
                    "text": "入口：Stage 1场景状态（1进入／0离开）",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_scene"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_transform",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        656,
                        1782,
                        260,
                        20
                    ],
                    "text": "入口：TRANSFORM—改变循环播放速度",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_transform"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_density",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        1948,
                        260,
                        20
                    ],
                    "text": "入口：DENSITY—改变55 Hz脉动速度",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_density"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_event_a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        678,
                        1948,
                        260,
                        20
                    ],
                    "text": "入口：EVENT A—触发倒放冲击",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_event_a"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_event_b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        678,
                        2029,
                        260,
                        20
                    ],
                    "text": "入口：EVENT B—触发短暂失速",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_event_b"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_auto_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1096,
                        2029,
                        260,
                        20
                    ],
                    "text": "入口：AUTO VOICE—开关连续循环语音",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_auto_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_voice",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1344,
                        1782,
                        260,
                        20
                    ],
                    "text": "入口：VOICE—控制语音前景音量",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_voice"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_bed_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2201,
                        260,
                        20
                    ],
                    "text": "入口：BED—控制55 Hz背景音量",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_bed_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s1_gain_cmd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1679,
                        1969,
                        260,
                        20
                    ],
                    "text": "入口：场景增益—切换时平滑淡入淡出",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s1_gain_cmd"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s1_player",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1091,
                        1888,
                        280,
                        20
                    ],
                    "text": "核心处理：groove~循环读取共享录音",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s1_player"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s1_mix",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1591,
                        2066,
                        280,
                        20
                    ],
                    "text": "汇合点：语音与BED相加后进入场景输出",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s1_mix"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_scene",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2570,
                        260,
                        20
                    ],
                    "text": "入口：Stage 2场景状态（2进入／离开）",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_scene"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_auto_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        524,
                        2633,
                        260,
                        20
                    ],
                    "text": "入口：AUTO VOICE—开关自动粒子流",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_auto_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_density",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        2667,
                        260,
                        20
                    ],
                    "text": "入口：DENSITY—控制粒子触发间隔",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_density"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_transform",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        656,
                        2696,
                        260,
                        20
                    ],
                    "text": "入口：TRANSFORM—控制粒长与滤波暗度",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_transform"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_event_a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        135,
                        2755,
                        260,
                        20
                    ],
                    "text": "入口：EVENT A—触发约1.2秒粒子风暴",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_event_a"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_event_b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1239,
                        2640,
                        260,
                        20
                    ],
                    "text": "入口：EVENT B—召回较清楚的语音片段",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_event_b"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_hold",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1239,
                        2710,
                        260,
                        20
                    ],
                    "text": "入口：HOLD—抓住并循环一个残片",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_hold"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_voice",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1954,
                        2858,
                        260,
                        20
                    ],
                    "text": "入口：VOICE—控制整层语音粒子音量",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_voice"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_bed_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3025,
                        260,
                        20
                    ],
                    "text": "入口：BED—控制金属背景与背景事件",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_bed_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_metal_density",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3113,
                        260,
                        20
                    ],
                    "text": "入口：DENSITY同时改变金属碎片密度",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_metal_density"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_bed_particle_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3414,
                        260,
                        20
                    ],
                    "text": "入口：BED PARTICLE—触发金属碎屑爆裂",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_bed_particle_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s2_gain_cmd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        831,
                        2955,
                        260,
                        20
                    ],
                    "text": "入口：Stage 2场景增益淡入淡出",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s2_gain_cmd"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s2_grain_poly",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1076,
                        2868,
                        280,
                        20
                    ],
                    "text": "核心处理：poly~轮询四个语音粒子声部",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s2_grain_poly"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s2_filter",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1695,
                        2769,
                        280,
                        20
                    ],
                    "text": "核心处理：低通／共振塑造粒子暗度",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s2_filter"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s2_mix_l",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        711,
                        2912,
                        280,
                        20
                    ],
                    "text": "汇合点：语音粒子、召回与HOLD混合",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s2_mix_l"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_scene",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        3915,
                        260,
                        20
                    ],
                    "text": "入口：Stage 3场景状态（3进入／离开）",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_scene"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_transform",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        656,
                        3944,
                        260,
                        20
                    ],
                    "text": "入口：TRANSFORM—从高位拉回0完成重组",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_transform"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_event_a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1360,
                        3970,
                        260,
                        20
                    ],
                    "text": "入口：EVENT A—触发约3秒逐渐显现",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_event_a"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_event_b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1360,
                        4042,
                        260,
                        20
                    ],
                    "text": "入口：EVENT B—召回清晰原句开头",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_event_b"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_auto_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        656,
                        4170,
                        260,
                        20
                    ],
                    "text": "入口：AUTO VOICE—开关连续重组语音",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_auto_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_voice",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1360,
                        3944,
                        260,
                        20
                    ],
                    "text": "入口：VOICE—控制归返语音音量",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_voice"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_bed_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4279,
                        260,
                        20
                    ],
                    "text": "入口：BED—控制风沙与归返坐标",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_bed_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_density",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4388,
                        260,
                        20
                    ],
                    "text": "入口：DENSITY—控制背景呼吸速度",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_density"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_bed_particle_receive",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1065,
                        4615,
                        260,
                        20
                    ],
                    "text": "入口：BED PARTICLE—触发约1.5秒沙浪",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_bed_particle_receive"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12,
                    "id": "label_note_s3_gain_cmd",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1943,
                        4070,
                        260,
                        20
                    ],
                    "text": "入口：Stage 3场景增益淡入淡出",
                    "textcolor": [
                        0.2,
                        0.72,
                        0.95,
                        1
                    ],
                    "varname": "label_note_s3_gain_cmd"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s3_player",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1096,
                        4115,
                        280,
                        20
                    ],
                    "text": "核心处理：groove~循环读取共享录音",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s3_player"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s3_filter",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1360,
                        4171,
                        280,
                        20
                    ],
                    "text": "核心处理：滤波逐步打开，让语言重新清晰",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s3_filter"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s3_residual_noise",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        953,
                        4444,
                        280,
                        20
                    ],
                    "text": "声音源：残余摩擦噪声，随重组逐渐退去",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s3_residual_noise"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s3_sand_noise",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40,
                        4588,
                        280,
                        20
                    ],
                    "text": "声音源：持续风沙BED",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s3_sand_noise"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 11,
                    "id": "label_note_s3_mix",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1572,
                        4233,
                        280,
                        20
                    ],
                    "text": "汇合点：重组语音、召回与BED进入场景输出",
                    "textcolor": [
                        0.55,
                        0.7,
                        0.8,
                        1
                    ],
                    "varname": "label_note_s3_mix"
                }
            },
            {
                "box": {
                    "id": "osc_master_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1570,
                        5822,
                        70,
                        22
                    ],
                    "text": "clip 0. 1.",
                    "varname": "osc_master_clip"
                }
            },
            {
                "box": {
                    "id": "osc_master_scale",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1660,
                        5822,
                        55,
                        22
                    ],
                    "text": "* 127.",
                    "varname": "osc_master_scale"
                }
            },
            {
                "box": {
                    "id": "osc_master_raw_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1735,
                        5822,
                        145,
                        22
                    ],
                    "text": "s ui_master_remote_raw",
                    "varname": "osc_master_raw_send"
                }
            },
            {
                "box": {
                    "id": "osc_master_raw_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420,
                        1015,
                        145,
                        22
                    ],
                    "text": "r ui_master_remote_raw",
                    "varname": "osc_master_raw_receive"
                }
            },
            {
                "box": {
                    "id": "osc_dsp_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1570,
                        5860,
                        65,
                        22
                    ],
                    "text": "clip 0 1",
                    "varname": "osc_dsp_clip"
                }
            },
            {
                "box": {
                    "id": "osc_dsp_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1715,
                        5860,
                        75,
                        22
                    ],
                    "text": "s ctl_dsp",
                    "varname": "osc_dsp_send"
                }
            },
            {
                "box": {
                    "id": "dsp_remote_receive",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        720,
                        1194,
                        75,
                        22
                    ],
                    "text": "r ctl_dsp",
                    "varname": "dsp_remote_receive"
                }
            },
            {
                "box": {
                    "id": "osc_sync_select",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        ""
                    ],
                    "patching_rect": [
                        1630,
                        5898,
                        45,
                        22
                    ],
                    "text": "sel 1",
                    "varname": "osc_sync_select"
                }
            },
            {
                "box": {
                    "id": "osc_sync_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1695,
                        5898,
                        160,
                        22
                    ],
                    "text": "s touchosc_sync_request",
                    "varname": "osc_sync_send"
                }
            },
            {
                "box": {
                    "id": "timer_feedback_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        1400,
                        1350,
                        155,
                        22
                    ],
                    "text": "s nostos_timer_seconds",
                    "varname": "timer_feedback_send"
                }
            },
            {
                "box": {
                    "id": "touchosc_feedback",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [
                            70,
                            100,
                            970,
                            810
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "osc_fb_label",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        20,
                                        10,
                                        620,
                                        22
                                    ],
                                    "text": "Max → TouchOSC 状态回传：数值缓存、SYNC重发、UDP 9001",
                                    "varname": "osc_fb_label"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_sync_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        500,
                                        155,
                                        22
                                    ],
                                    "text": "r touchosc_sync_request",
                                    "varname": "osc_fb_sync_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_stage_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        45,
                                        145,
                                        22
                                    ],
                                    "text": "r nostos_scene",
                                    "varname": "osc_fb_stage_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_stage_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        45,
                                        55,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_stage_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_stage_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        45,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/stage",
                                    "varname": "osc_fb_stage_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_stage_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        45,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_stage_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transform_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        85,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_transform",
                                    "varname": "osc_fb_transform_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transform_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        85,
                                        55,
                                        22
                                    ],
                                    "text": "float",
                                    "varname": "osc_fb_transform_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transform_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        85,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/transform",
                                    "varname": "osc_fb_transform_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transform_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        85,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_transform_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_density_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        125,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_density",
                                    "varname": "osc_fb_density_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_density_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        125,
                                        55,
                                        22
                                    ],
                                    "text": "float",
                                    "varname": "osc_fb_density_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_density_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        125,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/density",
                                    "varname": "osc_fb_density_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_density_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        125,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_density_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_voice_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        165,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_voice",
                                    "varname": "osc_fb_voice_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_voice_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        165,
                                        55,
                                        22
                                    ],
                                    "text": "float",
                                    "varname": "osc_fb_voice_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_voice_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        165,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/voice",
                                    "varname": "osc_fb_voice_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_voice_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        165,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_voice_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_bed_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        205,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_bed",
                                    "varname": "osc_fb_bed_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_bed_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        205,
                                        55,
                                        22
                                    ],
                                    "text": "float",
                                    "varname": "osc_fb_bed_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_bed_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        205,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/bed",
                                    "varname": "osc_fb_bed_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_bed_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        205,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_bed_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_auto_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        245,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_auto_voice",
                                    "varname": "osc_fb_auto_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_auto_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        245,
                                        55,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_auto_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_auto_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        245,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/auto",
                                    "varname": "osc_fb_auto_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_auto_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        245,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_auto_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_hold_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        285,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_hold",
                                    "varname": "osc_fb_hold_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_hold_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        285,
                                        55,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_hold_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_hold_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        285,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/hold",
                                    "varname": "osc_fb_hold_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_hold_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        285,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_hold_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_mute_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        325,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_mute",
                                    "varname": "osc_fb_mute_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_mute_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        325,
                                        55,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_mute_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_mute_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        325,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/mute",
                                    "varname": "osc_fb_mute_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_mute_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        325,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_mute_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_master_db_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        365,
                                        145,
                                        22
                                    ],
                                    "text": "r ctl_master_db",
                                    "varname": "osc_fb_master_db_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_master_db_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        365,
                                        55,
                                        22
                                    ],
                                    "text": "float",
                                    "varname": "osc_fb_master_db_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_master_db_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        365,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/master_db",
                                    "varname": "osc_fb_master_db_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_master_db_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        365,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_master_db_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_record_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        405,
                                        145,
                                        22
                                    ],
                                    "text": "r rec_control",
                                    "varname": "osc_fb_record_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_record_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        405,
                                        55,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_record_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_record_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        405,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/record",
                                    "varname": "osc_fb_record_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_record_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        405,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_record_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_timer_seconds_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        445,
                                        145,
                                        22
                                    ],
                                    "text": "r nostos_timer_seconds",
                                    "varname": "osc_fb_timer_seconds_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_timer_seconds_change",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        180,
                                        445,
                                        55,
                                        22
                                    ],
                                    "text": "change",
                                    "varname": "osc_fb_timer_seconds_change"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_timer_seconds_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        250,
                                        445,
                                        45,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_timer_seconds_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_timer_seconds_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        440,
                                        445,
                                        220,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/timer_seconds",
                                    "varname": "osc_fb_timer_seconds_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_timer_seconds_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        680,
                                        445,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_timer_seconds_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_poll_start",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        550,
                                        75,
                                        22
                                    ],
                                    "text": "loadmess 1",
                                    "varname": "osc_fb_dsp_poll_start"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_poll_clock",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        110,
                                        550,
                                        75,
                                        22
                                    ],
                                    "text": "qmetro 500",
                                    "varname": "osc_fb_dsp_poll_clock"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_status",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        200,
                                        550,
                                        100,
                                        22
                                    ],
                                    "text": "adstatus switch",
                                    "varname": "osc_fb_dsp_status"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_value",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        320,
                                        550,
                                        45,
                                        22
                                    ],
                                    "text": "int",
                                    "varname": "osc_fb_dsp_value"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        475,
                                        550,
                                        195,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/dsp",
                                    "varname": "osc_fb_dsp_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_dsp_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        690,
                                        550,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_dsp_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transport_pack",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        590,
                                        70,
                                        22
                                    ],
                                    "text": "pack 0 0",
                                    "varname": "osc_fb_transport_pack"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transport_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        110,
                                        590,
                                        235,
                                        22
                                    ],
                                    "text": "prepend /nostos/state/transport",
                                    "varname": "osc_fb_transport_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_transport_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        365,
                                        590,
                                        165,
                                        22
                                    ],
                                    "text": "s nostos_feedback_packet",
                                    "varname": "osc_fb_transport_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_packet_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        20,
                                        650,
                                        165,
                                        22
                                    ],
                                    "text": "r nostos_feedback_packet",
                                    "varname": "osc_fb_packet_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_udp_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        210,
                                        650,
                                        165,
                                        22
                                    ],
                                    "text": "udpsend 127.0.0.1 9001",
                                    "varname": "osc_fb_udp_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_host_receive",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        650,
                                        170,
                                        22
                                    ],
                                    "text": "r touchosc_feedback_host",
                                    "varname": "osc_fb_host_receive"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_host_trigger",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [
                                        "bang",
                                        ""
                                    ],
                                    "patching_rect": [
                                        590,
                                        650,
                                        45,
                                        22
                                    ],
                                    "text": "t b s",
                                    "varname": "osc_fb_host_trigger"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_host_prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        655,
                                        650,
                                        90,
                                        22
                                    ],
                                    "text": "prepend host",
                                    "varname": "osc_fb_host_prepend"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_sync_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        765,
                                        690,
                                        160,
                                        22
                                    ],
                                    "text": "s touchosc_sync_request",
                                    "varname": "osc_fb_sync_send"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_host_default",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [
                                        ""
                                    ],
                                    "patching_rect": [
                                        400,
                                        690,
                                        135,
                                        22
                                    ],
                                    "text": "loadmess 127.0.0.1",
                                    "varname": "osc_fb_host_default"
                                }
                            },
                            {
                                "box": {
                                    "id": "osc_fb_host_default_send",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "outlettype": [],
                                    "patching_rect": [
                                        555,
                                        730,
                                        170,
                                        22
                                    ],
                                    "text": "s touchosc_feedback_host",
                                    "varname": "osc_fb_host_default_send"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_stage_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_stage_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_stage_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_stage_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_stage_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_stage_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_stage_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_transform_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transform_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_transform_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transform_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_transform_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transform_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transform_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_density_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_density_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_density_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_density_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_density_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_density_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_density_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_voice_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_voice_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_voice_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_voice_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_voice_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_voice_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_voice_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_bed_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_bed_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_bed_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_bed_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_bed_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_bed_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_bed_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_auto_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_auto_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_auto_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_auto_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_auto_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_auto_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_auto_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_hold_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_hold_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_hold_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_hold_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_hold_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_hold_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_hold_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_mute_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_mute_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_mute_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_mute_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_mute_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_mute_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_mute_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_master_db_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_master_db_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_master_db_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_master_db_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_master_db_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_master_db_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_master_db_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_record_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_record_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_record_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_record_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_record_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_record_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_record_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_timer_seconds_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_timer_seconds_change",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_timer_seconds_change",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_timer_seconds_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_timer_seconds_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_timer_seconds_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_timer_seconds_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_timer_seconds_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_timer_seconds_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_poll_start",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_poll_clock",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_poll_clock",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_status",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_status",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_value",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_sync_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_dsp_value",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_stage_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transport_pack",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_timer_seconds_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transport_pack",
                                        1
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_dsp_poll_clock",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transport_pack",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_transport_pack",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transport_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_transport_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_transport_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_packet_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_udp_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_host_receive",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_host_trigger",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_host_trigger",
                                        1
                                    ],
                                    "destination": [
                                        "osc_fb_host_prepend",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_host_prepend",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_udp_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_host_trigger",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_sync_send",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "osc_fb_host_default",
                                        0
                                    ],
                                    "destination": [
                                        "osc_fb_host_default_send",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [
                        1900,
                        5750,
                        155,
                        22
                    ],
                    "text": "p touchosc_feedback",
                    "varname": "touchosc_feedback"
                }
            },
            {
                "box": {
                    "id": "label_touchosc_feedback_host",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        1900,
                        5790,
                        360,
                        22
                    ],
                    "text": "配置：iPad IP（修改下面消息后点击；回传端口固定9001）",
                    "varname": "label_touchosc_feedback_host"
                }
            },
            {
                "box": {
                    "id": "ui_touchosc_feedback_host",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        ""
                    ],
                    "keymode": 1,
                    "lines": 1,
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [
                        1900,
                        5820,
                        155,
                        28
                    ],
                    "text": "127.0.0.1",
                    "varname": "ui_touchosc_feedback_host"
                }
            },
            {
                "box": {
                    "id": "touchosc_feedback_host_send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        2040,
                        5820,
                        170,
                        22
                    ],
                    "text": "s touchosc_feedback_host",
                    "varname": "touchosc_feedback_host_send"
                }
            },
            {
                "box": {
                    "id": "ui_touchosc_feedback_apply",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        2075,
                        5820,
                        28,
                        28
                    ],
                    "varname": "ui_touchosc_feedback_apply"
                }
            },
            {
                "box": {
                    "id": "label_touchosc_feedback_apply",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        2115,
                        5822,
                        105,
                        24
                    ],
                    "text": "控: 应用 IP",
                    "varname": "label_touchosc_feedback_apply"
                }
            },
            {
                "box": {
                    "id": "touchosc_feedback_text_route",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        1900,
                        5862,
                        70,
                        22
                    ],
                    "text": "route text",
                    "varname": "touchosc_feedback_text_route"
                }
            },
            {
                "box": {
                    "id": "touchosc_feedback_tosymbol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1990,
                        5862,
                        65,
                        22
                    ],
                    "text": "tosymbol",
                    "varname": "touchosc_feedback_tosymbol"
                }
            },
            {
                "box": {
                    "id": "osc_stage_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_stage_int"
                }
            },
            {
                "box": {
                    "id": "osc_event_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        820,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_event_int"
                }
            },
            {
                "box": {
                    "id": "osc_record_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        940,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_record_int"
                }
            },
            {
                "box": {
                    "id": "osc_play_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1060,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_play_int"
                }
            },
            {
                "box": {
                    "id": "osc_mute_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1250,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_mute_int"
                }
            },
            {
                "box": {
                    "id": "osc_hold_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1350,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_hold_int"
                }
            },
            {
                "box": {
                    "id": "osc_reset_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1555,
                        5788,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_reset_int"
                }
            },
            {
                "box": {
                    "id": "osc_auto_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        2070,
                        5898,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_auto_int"
                }
            },
            {
                "box": {
                    "id": "osc_bed_particle_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1820,
                        5898,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_bed_particle_int"
                }
            },
            {
                "box": {
                    "id": "osc_dsp_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1655,
                        5860,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_dsp_int"
                }
            },
            {
                "box": {
                    "id": "osc_sync_int",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        1570,
                        5898,
                        40,
                        22
                    ],
                    "text": "int",
                    "varname": "osc_sync_int"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "ui_auto_voice",
                        0
                    ],
                    "source": [
                        "auto_voice_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_auto_voice",
                        0
                    ],
                    "source": [
                        "auto_voice_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_bed",
                        0
                    ],
                    "source": [
                        "bed_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "bed_send",
                        0
                    ],
                    "source": [
                        "bed_norm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_bed",
                        0
                    ],
                    "source": [
                        "bed_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_density",
                        0
                    ],
                    "source": [
                        "density_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "density_send",
                        0
                    ],
                    "source": [
                        "density_norm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_density",
                        0
                    ],
                    "source": [
                        "density_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "density_value",
                        0
                    ],
                    "source": [
                        "density_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_hold",
                        0
                    ],
                    "source": [
                        "hold_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_master_remote",
                        0
                    ],
                    "source": [
                        "master_remote_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_master",
                        0
                    ],
                    "source": [
                        "master_remote_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_master_db",
                        0
                    ],
                    "source": [
                        "master_remote_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mcp_thispatcher",
                        0
                    ],
                    "source": [
                        "mcp_server",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_mute",
                        0
                    ],
                    "source": [
                        "mute_bottom_state_set",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mute_remote_state_set",
                        0
                    ],
                    "source": [
                        "mute_remote_state_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_mute_remote",
                        0
                    ],
                    "source": [
                        "mute_remote_state_set",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-11",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-10",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-16",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-11",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-14",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-12",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-14",
                        1
                    ],
                    "source": [
                        "obj-bed-particle-13",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-15",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-16",
                        1
                    ],
                    "source": [
                        "obj-bed-particle-15",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-17",
                        1
                    ],
                    "source": [
                        "obj-bed-particle-16",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_bed_user_gain",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-17",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-19",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-18",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-13",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-bed-particle-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-9",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-bed-particle-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-3",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-bed-particle-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-5",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-bed-particle-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-22",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-9",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-13",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-5",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-12",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-bed-particle-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-8",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-bed-particle-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-10",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-10",
                        1
                    ],
                    "source": [
                        "obj-bed-particle-9",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-1",
                        0
                    ],
                    "source": [
                        "obj-bed-particle-ui",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-2",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-11",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-10",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-12",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-11",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-bed-particle-17",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-12",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-14",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-13",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-18",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-16",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-15",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-17",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-16",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-18",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-17",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-19",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-18",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-20",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-3",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-30",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-20",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-22",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-distinct-bed-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-23",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-distinct-bed-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-27",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-22",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-26",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-23",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-25",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-24",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-28",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-25",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-25",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-26",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-28",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-27",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-29",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-28",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-30",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-29",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-4",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_user_gain",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-30",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-32",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-31",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-27",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-32",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-5",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-distinct-bed-4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-7",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-distinct-bed-4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-6",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-5",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-10",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-8",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-9",
                        0
                    ],
                    "source": [
                        "obj-distinct-bed-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-10",
                        1
                    ],
                    "source": [
                        "obj-distinct-bed-9",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_voice_pack",
                        0
                    ],
                    "source": [
                        "obj-revision-a-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_cut_scale",
                        0
                    ],
                    "source": [
                        "obj-revision-a-10",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-20",
                        0
                    ],
                    "source": [
                        "obj-revision-a-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_voice_pack",
                        0
                    ],
                    "source": [
                        "obj-revision-a-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-21",
                        0
                    ],
                    "source": [
                        "obj-revision-a-20",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-22",
                        0
                    ],
                    "source": [
                        "obj-revision-a-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-23",
                        0
                    ],
                    "source": [
                        "obj-revision-a-22",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-24",
                        0
                    ],
                    "source": [
                        "obj-revision-a-23",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-25",
                        0
                    ],
                    "source": [
                        "obj-revision-a-24",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-26",
                        1
                    ],
                    "source": [
                        "obj-revision-a-25",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-33",
                        0
                    ],
                    "source": [
                        "obj-revision-a-26",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-28",
                        0
                    ],
                    "source": [
                        "obj-revision-a-27",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-32",
                        0
                    ],
                    "source": [
                        "obj-revision-a-28",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-30",
                        0
                    ],
                    "source": [
                        "obj-revision-a-29",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_pack",
                        0
                    ],
                    "source": [
                        "obj-revision-a-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-31",
                        0
                    ],
                    "source": [
                        "obj-revision-a-30",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-32",
                        1
                    ],
                    "source": [
                        "obj-revision-a-31",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-33",
                        1
                    ],
                    "source": [
                        "obj-revision-a-32",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-distinct-bed-20",
                        0
                    ],
                    "source": [
                        "obj-revision-a-33",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-5",
                        0
                    ],
                    "source": [
                        "obj-revision-a-4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_player",
                        0
                    ],
                    "source": [
                        "obj-revision-a-5",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-7",
                        0
                    ],
                    "source": [
                        "obj-revision-a-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_trigger",
                        0
                    ],
                    "source": [
                        "obj-revision-a-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-9",
                        0
                    ],
                    "source": [
                        "obj-revision-a-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-7",
                        0
                    ],
                    "source": [
                        "obj-revision-a-9",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_bed_mul",
                        0
                    ],
                    "source": [
                        "osc_bed_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_bed_ui_send",
                        0
                    ],
                    "source": [
                        "osc_bed_mul",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_density_send",
                        0
                    ],
                    "source": [
                        "osc_density_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_event_a_send",
                        0
                    ],
                    "source": [
                        "osc_event_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_event_b_send",
                        0
                    ],
                    "source": [
                        "osc_event_sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_play_send",
                        0
                    ],
                    "source": [
                        "osc_play_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_reset_send",
                        0
                    ],
                    "source": [
                        "osc_reset_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_auto_clip",
                        0
                    ],
                    "source": [
                        "osc_route",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_bed_clip",
                        0
                    ],
                    "source": [
                        "osc_route",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_density_clip",
                        0
                    ],
                    "source": [
                        "osc_route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_transform_clip",
                        0
                    ],
                    "source": [
                        "osc_route",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_voice_clip",
                        0
                    ],
                    "source": [
                        "osc_route",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_transform_send",
                        0
                    ],
                    "source": [
                        "osc_transform_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_route",
                        0
                    ],
                    "source": [
                        "osc_udp",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "osc_voice_send",
                        0
                    ],
                    "source": [
                        "osc_voice_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_gain_l",
                        0
                    ],
                    "source": [
                        "out_clip_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_gain_r",
                        0
                    ],
                    "source": [
                        "out_clip_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_dac",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "out_gain_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_meter_l",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "out_gain_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_dac",
                        1
                    ],
                    "order": 0,
                    "source": [
                        "out_gain_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_meter_r",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "out_gain_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_mute_pack",
                        0
                    ],
                    "source": [
                        "out_invert",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add2",
                        0
                    ],
                    "source": [
                        "out_l_add1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add3",
                        0
                    ],
                    "source": [
                        "out_l_add2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_master",
                        0
                    ],
                    "source": [
                        "out_l_add3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_clip_l",
                        0
                    ],
                    "source": [
                        "out_master",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_clip_r",
                        0
                    ],
                    "source": [
                        "out_master",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_mute",
                        0
                    ],
                    "source": [
                        "out_mute_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_gain_l",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "out_mute_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_gain_r",
                        1
                    ],
                    "order": 0,
                    "source": [
                        "out_mute_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_mute_line",
                        0
                    ],
                    "source": [
                        "out_mute_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mute_bottom_state_set",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "out_mute_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_invert",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "out_mute_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add1",
                        0
                    ],
                    "source": [
                        "out_original_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add1",
                        0
                    ],
                    "source": [
                        "out_original_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add2",
                        0
                    ],
                    "source": [
                        "out_r_add1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add3",
                        0
                    ],
                    "source": [
                        "out_r_add2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_master",
                        1
                    ],
                    "source": [
                        "out_r_add3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add1",
                        1
                    ],
                    "source": [
                        "out_s1_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add1",
                        1
                    ],
                    "source": [
                        "out_s1_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add2",
                        1
                    ],
                    "source": [
                        "out_s2_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add2",
                        1
                    ],
                    "source": [
                        "out_s2_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_l_add3",
                        1
                    ],
                    "source": [
                        "out_s3_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_r_add3",
                        1
                    ],
                    "source": [
                        "out_s3_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_meter",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "rec_adc",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_record",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "rec_adc",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_buffer",
                        0
                    ],
                    "source": [
                        "rec_clear",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_select",
                        0
                    ],
                    "source": [
                        "rec_control_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_duration_send",
                        0
                    ],
                    "source": [
                        "rec_duration",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_duration_store",
                        1
                    ],
                    "source": [
                        "rec_duration_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_start_prepend",
                        0
                    ],
                    "source": [
                        "rec_duration_store",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_send_l",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "rec_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_send_r",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "rec_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_duration_store",
                        0
                    ],
                    "source": [
                        "rec_play_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_level",
                        0
                    ],
                    "source": [
                        "rec_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_start_order",
                        0
                    ],
                    "source": [
                        "rec_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_stop_order",
                        0
                    ],
                    "source": [
                        "rec_select",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_clear",
                        0
                    ],
                    "source": [
                        "rec_start_order",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_record",
                        0
                    ],
                    "source": [
                        "rec_start_order",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_timer",
                        0
                    ],
                    "source": [
                        "rec_start_order",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_player",
                        0
                    ],
                    "source": [
                        "rec_start_prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_player",
                        0
                    ],
                    "source": [
                        "rec_stop_message",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_record",
                        0
                    ],
                    "source": [
                        "rec_stop_order",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_timer",
                        1
                    ],
                    "source": [
                        "rec_stop_order",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_stop_message",
                        0
                    ],
                    "source": [
                        "rec_stop_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_duration",
                        0
                    ],
                    "source": [
                        "rec_timer",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_master_value",
                        0
                    ],
                    "source": [
                        "reset_master_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_master_remote",
                        0
                    ],
                    "source": [
                        "reset_master_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_mute_value",
                        0
                    ],
                    "source": [
                        "reset_mute_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_mute_remote",
                        0
                    ],
                    "source": [
                        "reset_mute_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_reset",
                        0
                    ],
                    "source": [
                        "reset_preset_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_scene_value",
                        0
                    ],
                    "source": [
                        "reset_scene_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_scene_send",
                        0
                    ],
                    "source": [
                        "reset_scene_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_stop_send",
                        0
                    ],
                    "source": [
                        "reset_stop_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_store",
                        0
                    ],
                    "source": [
                        "s1_auto_event_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_line",
                        0
                    ],
                    "source": [
                        "s1_auto_event_on",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_mix",
                        0
                    ],
                    "source": [
                        "s1_auto_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_gain",
                        1
                    ],
                    "source": [
                        "s1_auto_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_restart",
                        0
                    ],
                    "source": [
                        "s1_auto_on_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_line",
                        0
                    ],
                    "source": [
                        "s1_auto_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_on_select",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s1_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_pack",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s1_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_store",
                        1
                    ],
                    "order": 2,
                    "source": [
                        "s1_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        0
                    ],
                    "source": [
                        "s1_auto_restart",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_pack",
                        0
                    ],
                    "source": [
                        "s1_auto_store",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_level",
                        0
                    ],
                    "source": [
                        "s1_bed",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_pulse",
                        0
                    ],
                    "source": [
                        "s1_bed_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_user_gain",
                        1
                    ],
                    "source": [
                        "s1_bed_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_line",
                        0
                    ],
                    "source": [
                        "s1_bed_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_user_gain",
                        0
                    ],
                    "source": [
                        "s1_bed_pulse",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_pack",
                        0
                    ],
                    "source": [
                        "s1_bed_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_mix",
                        1
                    ],
                    "source": [
                        "s1_bed_user_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_sel",
                        0
                    ],
                    "source": [
                        "s1_change",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_rate_scale",
                        0
                    ],
                    "source": [
                        "s1_density",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        2
                    ],
                    "source": [
                        "s1_duration",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_change",
                        0
                    ],
                    "source": [
                        "s1_equal",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_event_delay",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s1_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_event_on",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s1_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_reverse",
                        0
                    ],
                    "order": 3,
                    "source": [
                        "s1_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_reverse_delay",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s1_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_event_delay",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s1_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_event_on",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s1_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_lurch",
                        0
                    ],
                    "order": 3,
                    "source": [
                        "s1_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_lurch_delay",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s1_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_meter",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s1_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_send_l",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s1_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_send_r",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s1_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_gain_line",
                        0
                    ],
                    "source": [
                        "s1_gain_cmd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_gain",
                        1
                    ],
                    "source": [
                        "s1_gain_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_offset",
                        0
                    ],
                    "source": [
                        "s1_half",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_half",
                        0
                    ],
                    "source": [
                        "s1_lfo",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        1
                    ],
                    "source": [
                        "s1_loop_zero",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_line",
                        0
                    ],
                    "source": [
                        "s1_lurch",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_line",
                        0
                    ],
                    "source": [
                        "s1_lurch_back",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_lurch_back",
                        0
                    ],
                    "source": [
                        "s1_lurch_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_gain",
                        0
                    ],
                    "source": [
                        "s1_mix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_bed_pulse",
                        1
                    ],
                    "source": [
                        "s1_offset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_voice_static",
                        0
                    ],
                    "source": [
                        "s1_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_lfo",
                        0
                    ],
                    "source": [
                        "s1_rate_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_rate_line",
                        0
                    ],
                    "source": [
                        "s1_rate_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_rate_pack",
                        0
                    ],
                    "source": [
                        "s1_rate_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_line",
                        0
                    ],
                    "source": [
                        "s1_reverse",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_line",
                        0
                    ],
                    "source": [
                        "s1_reverse_back",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_reverse_back",
                        0
                    ],
                    "source": [
                        "s1_reverse_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_equal",
                        0
                    ],
                    "source": [
                        "s1_scene",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_start",
                        0
                    ],
                    "source": [
                        "s1_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_stop_delay",
                        0
                    ],
                    "source": [
                        "s1_sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        0
                    ],
                    "source": [
                        "s1_speed_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_line",
                        0
                    ],
                    "source": [
                        "s1_speed_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_pack",
                        0
                    ],
                    "source": [
                        "s1_speed_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        0
                    ],
                    "source": [
                        "s1_start",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_player",
                        0
                    ],
                    "source": [
                        "s1_stop",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_stop",
                        0
                    ],
                    "source": [
                        "s1_stop_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_speed_scale",
                        0
                    ],
                    "source": [
                        "s1_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-1",
                        0
                    ],
                    "source": [
                        "s1_voice",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_auto_gain",
                        0
                    ],
                    "source": [
                        "s1_voice_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_voice_gain",
                        1
                    ],
                    "source": [
                        "s1_voice_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_voice_line",
                        0
                    ],
                    "source": [
                        "s1_voice_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s1_voice_gain",
                        0
                    ],
                    "source": [
                        "s1_voice_static",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_add_b",
                        0
                    ],
                    "source": [
                        "s2_add_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_voice_gain",
                        0
                    ],
                    "source": [
                        "s2_add_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_sel",
                        0
                    ],
                    "source": [
                        "s2_auto_change",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_auto_change",
                        0
                    ],
                    "source": [
                        "s2_auto_expr",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_auto_expr",
                        0
                    ],
                    "source": [
                        "s2_auto_pak",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_auto_pak",
                        1
                    ],
                    "source": [
                        "s2_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_bed_user_gain",
                        1
                    ],
                    "source": [
                        "s2_bed_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_bed_line",
                        0
                    ],
                    "source": [
                        "s2_bed_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_bed_pack",
                        0
                    ],
                    "source": [
                        "s2_bed_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_mix_l",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "s2_bed_user_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_mix_r",
                        1
                    ],
                    "order": 0,
                    "source": [
                        "s2_bed_user_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_end",
                        1
                    ],
                    "source": [
                        "s2_calc",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_end",
                        0
                    ],
                    "source": [
                        "s2_calc",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_auto_pak",
                        0
                    ],
                    "source": [
                        "s2_change",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_filter",
                        1
                    ],
                    "source": [
                        "s2_cut_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_cut_line",
                        0
                    ],
                    "source": [
                        "s2_cut_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_cut_pack",
                        0
                    ],
                    "source": [
                        "s2_cut_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_interval_scale",
                        0
                    ],
                    "source": [
                        "s2_density",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_duration_scale",
                        0
                    ],
                    "source": [
                        "s2_duration",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_duration_min",
                        0
                    ],
                    "source": [
                        "s2_duration_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_rand_start",
                        1
                    ],
                    "source": [
                        "s2_duration_min",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_duration_int",
                        0
                    ],
                    "source": [
                        "s2_duration_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_end",
                        1
                    ],
                    "source": [
                        "s2_end",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_change",
                        0
                    ],
                    "source": [
                        "s2_equal",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-6",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s2_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-8",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s2_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_trigger",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s2_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_recall",
                        0
                    ],
                    "source": [
                        "s2_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_slice_level",
                        0
                    ],
                    "source": [
                        "s2_filter",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_gain_line",
                        0
                    ],
                    "source": [
                        "s2_gain_cmd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_meter_l",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s2_gain_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_send_l",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s2_gain_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_gain_l",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "s2_gain_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_gain_r",
                        1
                    ],
                    "order": 0,
                    "source": [
                        "s2_gain_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_meter_r",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s2_gain_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_send_r",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s2_gain_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_sel",
                        0
                    ],
                    "source": [
                        "s2_hold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_player",
                        2
                    ],
                    "source": [
                        "s2_hold_end",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_add_b",
                        1
                    ],
                    "source": [
                        "s2_hold_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_level",
                        0
                    ],
                    "source": [
                        "s2_hold_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_start",
                        0
                    ],
                    "source": [
                        "s2_hold_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_stop",
                        0
                    ],
                    "source": [
                        "s2_hold_sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_player",
                        0
                    ],
                    "source": [
                        "s2_hold_speed",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_player",
                        0
                    ],
                    "source": [
                        "s2_hold_start",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_player",
                        0
                    ],
                    "source": [
                        "s2_hold_stop",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_hold_player",
                        1
                    ],
                    "source": [
                        "s2_hold_zero",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_metro",
                        1
                    ],
                    "source": [
                        "s2_interval_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_interval_int",
                        0
                    ],
                    "source": [
                        "s2_interval_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_len_plus",
                        1
                    ],
                    "order": 1,
                    "source": [
                        "s2_len_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_end",
                        2
                    ],
                    "order": 0,
                    "source": [
                        "s2_len_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_len",
                        1
                    ],
                    "source": [
                        "s2_len_plus",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_len_int",
                        0
                    ],
                    "source": [
                        "s2_len_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_trigger",
                        0
                    ],
                    "source": [
                        "s2_metro",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_metro",
                        0
                    ],
                    "source": [
                        "s2_metro_off",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_metro",
                        0
                    ],
                    "source": [
                        "s2_metro_on",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_gain_l",
                        0
                    ],
                    "source": [
                        "s2_mix_l",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_gain_r",
                        0
                    ],
                    "source": [
                        "s2_mix_r",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_calc",
                        0
                    ],
                    "source": [
                        "s2_order",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_only",
                        0
                    ],
                    "source": [
                        "s2_order",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_filter",
                        0
                    ],
                    "source": [
                        "s2_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_player",
                        0
                    ],
                    "source": [
                        "s2_prepend",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_len_plus",
                        0
                    ],
                    "source": [
                        "s2_rand_len",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_len",
                        0
                    ],
                    "source": [
                        "s2_rand_start",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_recall_player",
                        0
                    ],
                    "source": [
                        "s2_recall",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_add_a",
                        1
                    ],
                    "source": [
                        "s2_recall_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_recall_level",
                        0
                    ],
                    "source": [
                        "s2_recall_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_equal",
                        0
                    ],
                    "source": [
                        "s2_scene",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_metro_off",
                        0
                    ],
                    "source": [
                        "s2_sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_metro_on",
                        0
                    ],
                    "source": [
                        "s2_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_add_a",
                        0
                    ],
                    "source": [
                        "s2_slice_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_prepend",
                        0
                    ],
                    "source": [
                        "s2_start_end",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_order",
                        0
                    ],
                    "source": [
                        "s2_start_len",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_start_end",
                        0
                    ],
                    "source": [
                        "s2_start_only",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_len_scale",
                        0
                    ],
                    "source": [
                        "s2_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-4",
                        0
                    ],
                    "source": [
                        "s2_trigger",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_rand_len",
                        0
                    ],
                    "source": [
                        "s2_trigger",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_rand_start",
                        0
                    ],
                    "source": [
                        "s2_trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-2",
                        0
                    ],
                    "source": [
                        "s2_voice",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_mix_l",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s2_voice_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_mix_r",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s2_voice_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_voice_gain",
                        1
                    ],
                    "source": [
                        "s2_voice_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s2_voice_line",
                        0
                    ],
                    "source": [
                        "s2_voice_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_store",
                        0
                    ],
                    "source": [
                        "s3_auto_event_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_line",
                        0
                    ],
                    "source": [
                        "s3_auto_event_on",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_mix",
                        0
                    ],
                    "source": [
                        "s3_auto_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_gain",
                        1
                    ],
                    "source": [
                        "s3_auto_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_restart",
                        0
                    ],
                    "source": [
                        "s3_auto_on_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_line",
                        0
                    ],
                    "source": [
                        "s3_auto_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_on_select",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s3_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_pack",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s3_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_store",
                        1
                    ],
                    "order": 2,
                    "source": [
                        "s3_auto_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        0
                    ],
                    "source": [
                        "s3_auto_restart",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_pack",
                        0
                    ],
                    "source": [
                        "s3_auto_store",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_a_level",
                        0
                    ],
                    "source": [
                        "s3_bed_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_mix",
                        0
                    ],
                    "source": [
                        "s3_bed_a_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_b_level",
                        0
                    ],
                    "source": [
                        "s3_bed_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_mix",
                        1
                    ],
                    "source": [
                        "s3_bed_b_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_user_gain",
                        1
                    ],
                    "source": [
                        "s3_bed_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-26",
                        0
                    ],
                    "source": [
                        "s3_bed_mix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_line",
                        0
                    ],
                    "source": [
                        "s3_bed_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_bed_pack",
                        0
                    ],
                    "source": [
                        "s3_bed_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_mix",
                        1
                    ],
                    "source": [
                        "s3_bed_user_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_sel",
                        0
                    ],
                    "source": [
                        "s3_change",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_filter",
                        1
                    ],
                    "source": [
                        "s3_cut_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_cut_line",
                        0
                    ],
                    "source": [
                        "s3_cut_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_cut_pack",
                        0
                    ],
                    "source": [
                        "s3_cut_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        2
                    ],
                    "source": [
                        "s3_duration",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_change",
                        0
                    ],
                    "source": [
                        "s3_equal",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_event_delay",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s3_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_event_on",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s3_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_oracle",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s3_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_recall",
                        0
                    ],
                    "source": [
                        "s3_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_static",
                        0
                    ],
                    "source": [
                        "s3_filter",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_meter",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s3_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_send_l",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s3_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_send_r",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s3_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_gain_line",
                        0
                    ],
                    "source": [
                        "s3_gain_cmd",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_gain",
                        1
                    ],
                    "source": [
                        "s3_gain_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_gain",
                        0
                    ],
                    "source": [
                        "s3_mix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_cut_line",
                        0
                    ],
                    "source": [
                        "s3_oracle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_filter",
                        0
                    ],
                    "source": [
                        "s3_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_recall_player",
                        0
                    ],
                    "source": [
                        "s3_recall",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_mix",
                        1
                    ],
                    "source": [
                        "s3_recall_level",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_recall_level",
                        0
                    ],
                    "source": [
                        "s3_recall_player",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_equal",
                        0
                    ],
                    "source": [
                        "s3_scene",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_start",
                        0
                    ],
                    "source": [
                        "s3_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_stop_delay",
                        0
                    ],
                    "source": [
                        "s3_sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        0
                    ],
                    "source": [
                        "s3_speed_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_speed_line",
                        0
                    ],
                    "source": [
                        "s3_speed_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_speed_pack",
                        0
                    ],
                    "source": [
                        "s3_speed_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        0
                    ],
                    "source": [
                        "s3_start",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_gain",
                        0
                    ],
                    "source": [
                        "s3_static",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        0
                    ],
                    "source": [
                        "s3_stop",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_stop",
                        0
                    ],
                    "source": [
                        "s3_stop_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-29",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "s3_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_cut_scale",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "s3_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_speed_scale",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "s3_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-revision-a-3",
                        0
                    ],
                    "source": [
                        "s3_voice",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_auto_gain",
                        0
                    ],
                    "source": [
                        "s3_voice_gain",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_gain",
                        1
                    ],
                    "source": [
                        "s3_voice_line",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_mix",
                        0
                    ],
                    "source": [
                        "s3_voice_mix",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_voice_line",
                        0
                    ],
                    "source": [
                        "s3_voice_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "s3_player",
                        1
                    ],
                    "source": [
                        "s3_zero",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_default_send",
                        0
                    ],
                    "source": [
                        "scene_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_scene_display",
                        0
                    ],
                    "source": [
                        "scene_display_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_unpack",
                        0
                    ],
                    "source": [
                        "scene_gain_off",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_unpack",
                        0
                    ],
                    "source": [
                        "scene_gain_s1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_unpack",
                        0
                    ],
                    "source": [
                        "scene_gain_s2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_unpack",
                        0
                    ],
                    "source": [
                        "scene_gain_s3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s1_pack",
                        0
                    ],
                    "source": [
                        "scene_gain_unpack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s2_pack",
                        0
                    ],
                    "source": [
                        "scene_gain_unpack",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s3_pack",
                        0
                    ],
                    "source": [
                        "scene_gain_unpack",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_unpack",
                        0
                    ],
                    "source": [
                        "scene_preset_reset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_unpack",
                        0
                    ],
                    "source": [
                        "scene_preset_return",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_unpack",
                        0
                    ],
                    "source": [
                        "scene_preset_s1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_unpack",
                        0
                    ],
                    "source": [
                        "scene_preset_s2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_unpack",
                        0
                    ],
                    "source": [
                        "scene_preset_s3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_auto_voice_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_bed_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_density_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_hold_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_transform_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "preset_voice_send",
                        0
                    ],
                    "source": [
                        "scene_preset_unpack",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_select",
                        0
                    ],
                    "source": [
                        "scene_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_return_play",
                        0
                    ],
                    "source": [
                        "scene_return_delay",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s1_send",
                        0
                    ],
                    "source": [
                        "scene_s1_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s2_send",
                        0
                    ],
                    "source": [
                        "scene_s2_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_s3_send",
                        0
                    ],
                    "source": [
                        "scene_s3_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_off",
                        0
                    ],
                    "source": [
                        "scene_select",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_off",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "scene_select",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_s1",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "scene_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_s2",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "scene_select",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_gain_s3",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "scene_select",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_return",
                        0
                    ],
                    "order": 2,
                    "source": [
                        "scene_select",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_s1",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "scene_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_s2",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "scene_select",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_preset_s3",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "scene_select",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_return_delay",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "scene_select",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_elapsed",
                        1
                    ],
                    "source": [
                        "timer_clock",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_performance_timer",
                        0
                    ],
                    "source": [
                        "timer_display_set",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_seconds_total",
                        0
                    ],
                    "source": [
                        "timer_elapsed",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_display_set",
                        0
                    ],
                    "source": [
                        "timer_format",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_pack",
                        0
                    ],
                    "source": [
                        "timer_minutes_divide",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_format",
                        0
                    ],
                    "source": [
                        "timer_pack",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_performance_timer",
                        0
                    ],
                    "source": [
                        "timer_reset_display",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_reset_trigger",
                        0
                    ],
                    "source": [
                        "timer_reset_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_reset_display",
                        0
                    ],
                    "source": [
                        "timer_reset_trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_stop_toggle",
                        0
                    ],
                    "source": [
                        "timer_reset_trigger",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_scene_select",
                        0
                    ],
                    "source": [
                        "timer_scene_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_start_trigger",
                        0
                    ],
                    "source": [
                        "timer_scene_select",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_pack",
                        1
                    ],
                    "source": [
                        "timer_seconds_modulo",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_split_trigger",
                        0
                    ],
                    "source": [
                        "timer_seconds_total",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_minutes_divide",
                        0
                    ],
                    "source": [
                        "timer_split_trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_seconds_modulo",
                        0
                    ],
                    "source": [
                        "timer_split_trigger",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_performance_timer",
                        0
                    ],
                    "source": [
                        "timer_start_display",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_clock",
                        0
                    ],
                    "source": [
                        "timer_start_toggle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_elapsed",
                        0
                    ],
                    "source": [
                        "timer_start_trigger",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_start_display",
                        0
                    ],
                    "source": [
                        "timer_start_trigger",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_start_toggle",
                        0
                    ],
                    "source": [
                        "timer_start_trigger",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "timer_clock",
                        0
                    ],
                    "source": [
                        "timer_stop_toggle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_transform",
                        0
                    ],
                    "source": [
                        "transform_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "transform_send",
                        0
                    ],
                    "source": [
                        "transform_norm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_transform",
                        0
                    ],
                    "source": [
                        "transform_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "transform_value",
                        0
                    ],
                    "source": [
                        "transform_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "auto_voice_send",
                        0
                    ],
                    "source": [
                        "ui_auto_voice",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "bed_norm",
                        0
                    ],
                    "source": [
                        "ui_bed",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_clear",
                        0
                    ],
                    "source": [
                        "ui_clear",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "density_norm",
                        0
                    ],
                    "source": [
                        "ui_density",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "event_a_send",
                        0
                    ],
                    "source": [
                        "ui_event_a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "event_b_send",
                        0
                    ],
                    "source": [
                        "ui_event_b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "hold_send",
                        0
                    ],
                    "source": [
                        "ui_hold",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "master_remote_send",
                        0
                    ],
                    "source": [
                        "ui_master_db",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "master_remote_scale",
                        0
                    ],
                    "source": [
                        "ui_master_remote",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "out_mute_send",
                        0
                    ],
                    "source": [
                        "ui_mute",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "mute_remote_send",
                        0
                    ],
                    "source": [
                        "ui_mute_remote",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_play_send",
                        0
                    ],
                    "source": [
                        "ui_play",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "rec_control_send",
                        0
                    ],
                    "source": [
                        "ui_record",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "reset_send",
                        0
                    ],
                    "source": [
                        "ui_reset",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_return_value",
                        0
                    ],
                    "source": [
                        "ui_return",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_send",
                        0
                    ],
                    "source": [
                        "ui_return_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_s1_value",
                        0
                    ],
                    "source": [
                        "ui_s1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_send",
                        0
                    ],
                    "source": [
                        "ui_s1_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_s2_value",
                        0
                    ],
                    "source": [
                        "ui_s2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_send",
                        0
                    ],
                    "source": [
                        "ui_s2_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_s3_value",
                        0
                    ],
                    "source": [
                        "ui_s3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "scene_send",
                        0
                    ],
                    "source": [
                        "ui_s3_value",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "transform_norm",
                        0
                    ],
                    "source": [
                        "ui_transform",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "voice_norm",
                        0
                    ],
                    "source": [
                        "ui_voice",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_voice",
                        0
                    ],
                    "source": [
                        "voice_default",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "voice_send",
                        0
                    ],
                    "source": [
                        "voice_norm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "ui_voice",
                        0
                    ],
                    "source": [
                        "voice_raw_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "voice_value",
                        0
                    ],
                    "source": [
                        "voice_receive",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        13
                    ],
                    "destination": [
                        "osc_master_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_master_clip",
                        0
                    ],
                    "destination": [
                        "osc_master_scale",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_master_scale",
                        0
                    ],
                    "destination": [
                        "osc_master_raw_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_master_raw_receive",
                        0
                    ],
                    "destination": [
                        "ui_master_remote",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        14
                    ],
                    "destination": [
                        "osc_dsp_clip",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "dsp_remote_receive",
                        0
                    ],
                    "destination": [
                        "ui_dsp_remote",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_sync_select",
                        0
                    ],
                    "destination": [
                        "osc_sync_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "timer_seconds_total",
                        0
                    ],
                    "destination": [
                        "timer_feedback_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui_touchosc_feedback_apply",
                        0
                    ],
                    "destination": [
                        "ui_touchosc_feedback_host",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui_touchosc_feedback_host",
                        0
                    ],
                    "destination": [
                        "touchosc_feedback_text_route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "touchosc_feedback_text_route",
                        0
                    ],
                    "destination": [
                        "touchosc_feedback_tosymbol",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "touchosc_feedback_tosymbol",
                        0
                    ],
                    "destination": [
                        "touchosc_feedback_host_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        0
                    ],
                    "destination": [
                        "osc_stage_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_stage_int",
                        0
                    ],
                    "destination": [
                        "osc_stage_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        4
                    ],
                    "destination": [
                        "osc_event_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_event_int",
                        0
                    ],
                    "destination": [
                        "osc_event_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        5
                    ],
                    "destination": [
                        "osc_record_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_record_int",
                        0
                    ],
                    "destination": [
                        "osc_record_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        6
                    ],
                    "destination": [
                        "osc_play_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_play_int",
                        0
                    ],
                    "destination": [
                        "osc_play_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        7
                    ],
                    "destination": [
                        "osc_mute_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_mute_int",
                        0
                    ],
                    "destination": [
                        "osc_mute_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        8
                    ],
                    "destination": [
                        "osc_hold_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_hold_int",
                        0
                    ],
                    "destination": [
                        "osc_hold_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        9
                    ],
                    "destination": [
                        "osc_reset_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_reset_int",
                        0
                    ],
                    "destination": [
                        "osc_reset_sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_auto_clip",
                        0
                    ],
                    "destination": [
                        "osc_auto_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_auto_int",
                        0
                    ],
                    "destination": [
                        "osc_auto_ui_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        12
                    ],
                    "destination": [
                        "osc_bed_particle_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_bed_particle_int",
                        0
                    ],
                    "destination": [
                        "obj-bed-particle-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_dsp_clip",
                        0
                    ],
                    "destination": [
                        "osc_dsp_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_dsp_int",
                        0
                    ],
                    "destination": [
                        "osc_dsp_send",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_route",
                        15
                    ],
                    "destination": [
                        "osc_sync_int",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "osc_sync_int",
                        0
                    ],
                    "destination": [
                        "osc_sync_select",
                        0
                    ]
                }
            }
        ],
        "parameters": {
            "out_master": [
                "Nostos Master",
                "MASTER",
                0
            ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ],
                    "buttons": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}
