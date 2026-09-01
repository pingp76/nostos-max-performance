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
      2200,
      1200
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      10,
      10
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "description": "Nostos five-minute performance and learning patch",
    "tags": "Nostos voice TouchOSC performance",
    "boxes": [
      {
        "box": {
          "id": "label_title",
          "maxclass": "comment",
          "patching_rect": [
            40,
            20,
            1500,
            34
          ],
          "varname": "label_title",
          "text": "NOSTOS：一句话的返航 — 五分钟演出主 Patch（学习展开版）",
          "fontsize": 24,
          "fontface": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            15,
            1000,
            32
          ]
        }
      },
      {
        "box": {
          "id": "label_reading",
          "maxclass": "comment",
          "patching_rect": [
            40,
            58,
            1200,
            26
          ],
          "varname": "label_reading",
          "text": "阅读顺序：从上到下。演出时使用 Presentation Mode；工程视图保留展开组件和中文说明。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "label_record_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            105,
            1200,
            32
          ],
          "varname": "label_record_section",
          "text": "1｜录音、共享 buffer 与原句播放",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.2,
            0.55,
            0.9,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_record_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            142,
            1100,
            26
          ],
          "varname": "label_record_help",
          "text": "先开启 DSP；RECORD 开始／停止录音；PLAY ORIGINAL 播放刚录下的实际时长。最长 15 秒。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "rec_adc",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            200,
            70,
            22
          ],
          "varname": "rec_adc",
          "text": "adc~ 1"
        }
      },
      {
        "box": {
          "id": "rec_meter",
          "maxclass": "meter~",
          "patching_rect": [
            130,
            180,
            18,
            80
          ],
          "varname": "rec_meter",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "rec_record",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            200,
            165,
            22
          ],
          "varname": "rec_record",
          "text": "record~ nostos_voice 1"
        }
      },
      {
        "box": {
          "id": "rec_buffer",
          "maxclass": "newobj",
          "patching_rect": [
            450,
            200,
            205,
            22
          ],
          "varname": "rec_buffer",
          "text": "buffer~ nostos_voice 15000 1"
        }
      },
      {
        "box": {
          "id": "rec_waveform",
          "maxclass": "waveform~",
          "patching_rect": [
            700,
            175,
            730,
            150
          ],
          "varname": "rec_waveform",
          "buffername": "nostos_voice",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            490,
            1040,
            125
          ]
        }
      },
      {
        "box": {
          "id": "label_waveform",
          "maxclass": "comment",
          "patching_rect": [
            700,
            332,
            500,
            23
          ],
          "varname": "label_waveform",
          "text": "waveform~ 只显示录音；本 Patch 没有连接擦除操作。",
          "fontsize": 12,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "ui_record",
          "maxclass": "toggle",
          "patching_rect": [
            40,
            295,
            36,
            36
          ],
          "varname": "ui_record",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            80,
            42,
            42
          ]
        }
      },
      {
        "box": {
          "id": "label_record",
          "maxclass": "comment",
          "patching_rect": [
            85,
            292,
            145,
            42
          ],
          "varname": "label_record",
          "text": "控: RECORD\n1=录音 0=停止",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            70,
            78,
            140,
            42
          ]
        }
      },
      {
        "box": {
          "id": "rec_control_send",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            335,
            100,
            22
          ],
          "varname": "rec_control_send",
          "text": "s rec_control"
        }
      },
      {
        "box": {
          "id": "rec_control_receive",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            370,
            100,
            22
          ],
          "varname": "rec_control_receive",
          "text": "r rec_control"
        }
      },
      {
        "box": {
          "id": "rec_select",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            370,
            65,
            22
          ],
          "varname": "rec_select",
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "rec_start_order",
          "maxclass": "newobj",
          "patching_rect": [
            245,
            350,
            65,
            22
          ],
          "varname": "rec_start_order",
          "text": "t 1 b b"
        }
      },
      {
        "box": {
          "id": "rec_stop_order",
          "maxclass": "newobj",
          "patching_rect": [
            245,
            390,
            55,
            22
          ],
          "varname": "rec_stop_order",
          "text": "t b 0"
        }
      },
      {
        "box": {
          "id": "rec_clear",
          "maxclass": "message",
          "patching_rect": [
            335,
            350,
            45,
            22
          ],
          "varname": "rec_clear",
          "text": "clear",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "rec_timer",
          "maxclass": "newobj",
          "patching_rect": [
            405,
            370,
            50,
            22
          ],
          "varname": "rec_timer",
          "text": "timer"
        }
      },
      {
        "box": {
          "id": "rec_duration",
          "maxclass": "number",
          "patching_rect": [
            480,
            370,
            95,
            22
          ],
          "varname": "rec_duration",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "label_duration",
          "maxclass": "comment",
          "patching_rect": [
            480,
            342,
            120,
            23
          ],
          "varname": "label_duration",
          "text": "录音时长 ms",
          "fontsize": 12,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "rec_duration_send",
          "maxclass": "newobj",
          "patching_rect": [
            595,
            370,
            125,
            22
          ],
          "varname": "rec_duration_send",
          "text": "s rec_duration_ms"
        }
      },
      {
        "box": {
          "id": "ui_clear",
          "maxclass": "button",
          "patching_rect": [
            335,
            295,
            28,
            28
          ],
          "varname": "ui_clear",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "label_clear",
          "maxclass": "comment",
          "patching_rect": [
            375,
            300,
            70,
            23
          ],
          "varname": "label_clear",
          "text": "CLEAR",
          "fontsize": 12,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "ui_play",
          "maxclass": "button",
          "patching_rect": [
            500,
            295,
            36,
            36
          ],
          "varname": "ui_play",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            230,
            80,
            42,
            42
          ]
        }
      },
      {
        "box": {
          "id": "label_play",
          "maxclass": "comment",
          "patching_rect": [
            550,
            303,
            145,
            23
          ],
          "varname": "label_play",
          "text": "控: PLAY ORIGINAL",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            280,
            90,
            150,
            23
          ]
        }
      },
      {
        "box": {
          "id": "rec_play_send",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            410,
            105,
            22
          ],
          "varname": "rec_play_send",
          "text": "s play_original"
        }
      },
      {
        "box": {
          "id": "rec_play_receive",
          "maxclass": "newobj",
          "patching_rect": [
            820,
            370,
            105,
            22
          ],
          "varname": "rec_play_receive",
          "text": "r play_original"
        }
      },
      {
        "box": {
          "id": "rec_duration_receive",
          "maxclass": "newobj",
          "patching_rect": [
            820,
            410,
            125,
            22
          ],
          "varname": "rec_duration_receive",
          "text": "r rec_duration_ms"
        }
      },
      {
        "box": {
          "id": "rec_duration_store",
          "maxclass": "newobj",
          "patching_rect": [
            965,
            370,
            65,
            22
          ],
          "varname": "rec_duration_store",
          "text": "f 5000."
        }
      },
      {
        "box": {
          "id": "rec_start_prepend",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            370,
            115,
            22
          ],
          "varname": "rec_start_prepend",
          "text": "prepend start 0"
        }
      },
      {
        "box": {
          "id": "rec_player",
          "maxclass": "newobj",
          "patching_rect": [
            1190,
            370,
            130,
            22
          ],
          "varname": "rec_player",
          "text": "play~ nostos_voice"
        }
      },
      {
        "box": {
          "id": "rec_stop_receive",
          "maxclass": "newobj",
          "patching_rect": [1050, 410, 110, 22],
          "varname": "rec_stop_receive",
          "text": "r stop_original"
        }
      },
      {
        "box": {
          "id": "rec_stop_message",
          "maxclass": "message",
          "patching_rect": [1190, 410, 45, 22],
          "varname": "rec_stop_message",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "reset_stop_receive",
          "maxclass": "newobj",
          "patching_rect": [1600, 410, 85, 22],
          "varname": "reset_stop_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_stop_send",
          "maxclass": "newobj",
          "patching_rect": [1705, 410, 110, 22],
          "varname": "reset_stop_send",
          "text": "s stop_original"
        }
      },
      {
        "box": {
          "id": "rec_level",
          "maxclass": "newobj",
          "patching_rect": [
            1340,
            370,
            55,
            22
          ],
          "varname": "rec_level",
          "text": "*~ 0.6"
        }
      },
      {
        "box": {
          "id": "rec_send_l",
          "maxclass": "newobj",
          "patching_rect": [
            1420,
            355,
            160,
            22
          ],
          "varname": "rec_send_l",
          "text": "send~ nostos_original_l"
        }
      },
      {
        "box": {
          "id": "rec_send_r",
          "maxclass": "newobj",
          "patching_rect": [
            1420,
            395,
            160,
            22
          ],
          "varname": "rec_send_r",
          "text": "send~ nostos_original_r"
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
              "revision": 4,
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
                  "maxclass": "newobj",
                  "numinlets": 9,
                  "numoutlets": 9,
                  "outlettype": [
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
                  "text": "prepend send",
                  "varname": "mcp_psend_n"
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
                  "source": [
                    "obj-2",
                    5
                  ],
                  "destination": [
                    "obj-35",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-35",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    8
                  ],
                  "destination": [
                    "obj-36",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-36",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    9
                  ],
                  "destination": [
                    "obj-37",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-37",
                    0
                  ],
                  "destination": [
                    "obj-13",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    10
                  ],
                  "destination": [
                    "obj-38",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-38",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    11
                  ],
                  "destination": [
                    "obj-39",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-39",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    12
                  ],
                  "destination": [
                    "obj-40",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-40",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    13
                  ],
                  "destination": [
                    "obj-41",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-41",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    14
                  ],
                  "destination": [
                    "obj-42",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-42",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    15
                  ],
                  "destination": [
                    "obj-43",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-43",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    16
                  ],
                  "destination": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-44",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    17
                  ],
                  "destination": [
                    "obj-45",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-45",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-2",
                    18
                  ],
                  "destination": [
                    "obj-46",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-46",
                    0
                  ],
                  "destination": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-maxpacket-init",
                    0
                  ],
                  "destination": [
                    "obj-13",
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
          "patching_rect": [
            1900,
            200,
            90,
            22
          ],
          "varname": "mcp_thispatcher",
          "text": "thispatcher"
        }
      },
      {
        "box": {
          "id": "label_mcp",
          "maxclass": "comment",
          "patching_rect": [
            1740,
            105,
            420,
            45
          ],
          "varname": "label_mcp",
          "text": "MCP BRIDGE\n用于运行时读取、状态和已有参数；不用于重建／保存结构。",
          "fontsize": 12,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "label_control_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            455,
            1200,
            32
          ],
          "varname": "label_control_section",
          "text": "2｜场景、宏观控制与演出调试遥控",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.75,
            0.45,
            0.15,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_control_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            492,
            1200,
            26
          ],
          "varname": "label_control_help",
          "text": "按钮选择内部场景；line~ 在 500 ms 内交叉淡化。推子 0–100 会转换成标准化 0.0–1.0。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "ui_s1",
          "maxclass": "button",
          "patching_rect": [
            40,
            550,
            42,
            42
          ],
          "varname": "ui_s1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            160,
            52,
            52
          ]
        }
      },
      {
        "box": {
          "id": "ui_s1_value",
          "maxclass": "message",
          "patching_rect": [
            40,
            610,
            35,
            22
          ],
          "varname": "ui_s1_value",
          "text": "1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui_s2",
          "maxclass": "button",
          "patching_rect": [
            120,
            550,
            42,
            42
          ],
          "varname": "ui_s2",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            100,
            160,
            52,
            52
          ]
        }
      },
      {
        "box": {
          "id": "ui_s2_value",
          "maxclass": "message",
          "patching_rect": [
            120,
            610,
            35,
            22
          ],
          "varname": "ui_s2_value",
          "text": "2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui_s3",
          "maxclass": "button",
          "patching_rect": [
            200,
            550,
            42,
            42
          ],
          "varname": "ui_s3",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            180,
            160,
            52,
            52
          ]
        }
      },
      {
        "box": {
          "id": "ui_s3_value",
          "maxclass": "message",
          "patching_rect": [
            200,
            610,
            35,
            22
          ],
          "varname": "ui_s3_value",
          "text": "3",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui_return",
          "maxclass": "button",
          "patching_rect": [
            280,
            550,
            42,
            42
          ],
          "varname": "ui_return",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            260,
            160,
            52,
            52
          ]
        }
      },
      {
        "box": {
          "id": "ui_return_value",
          "maxclass": "message",
          "patching_rect": [
            280,
            610,
            35,
            22
          ],
          "varname": "ui_return_value",
          "text": "4",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "label_stages",
          "maxclass": "comment",
          "patching_rect": [
            40,
            522,
            340,
            23
          ],
          "varname": "label_stages",
          "text": "控: STAGE 1      STAGE 2      STAGE 3      RETURN",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            20,
            130,
            360,
            23
          ]
        }
      },
      {
        "box": {
          "id": "scene_send",
          "maxclass": "newobj",
          "patching_rect": [
            365,
            610,
            105,
            22
          ],
          "varname": "scene_send",
          "text": "s nostos_scene"
        }
      },
      {
        "box": {
          "id": "scene_receive",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            675,
            105,
            22
          ],
          "varname": "scene_receive",
          "text": "r nostos_scene"
        }
      },
      {
        "box": {
          "id": "scene_select",
          "maxclass": "newobj",
          "patching_rect": [
            165,
            675,
            105,
            22
          ],
          "varname": "scene_select",
          "text": "sel 1 2 3 4 0"
        }
      },
      {
        "box": {
          "id": "scene_gain_s1",
          "maxclass": "message",
          "patching_rect": [
            300,
            645,
            70,
            22
          ],
          "varname": "scene_gain_s1",
          "text": "1. 0. 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scene_gain_s2",
          "maxclass": "message",
          "patching_rect": [
            300,
            675,
            70,
            22
          ],
          "varname": "scene_gain_s2",
          "text": "0. 1. 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scene_gain_s3",
          "maxclass": "message",
          "patching_rect": [
            300,
            705,
            70,
            22
          ],
          "varname": "scene_gain_s3",
          "text": "0. 0. 1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scene_gain_off",
          "maxclass": "message",
          "patching_rect": [
            800,
            735,
            70,
            22
          ],
          "varname": "scene_gain_off",
          "text": "0. 0. 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scene_gain_unpack",
          "maxclass": "newobj",
          "patching_rect": [
            395,
            675,
            120,
            22
          ],
          "varname": "scene_gain_unpack",
          "text": "unpack 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "scene_s1_pack",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            645,
            95,
            22
          ],
          "varname": "scene_s1_pack",
          "text": "pack 0. 500"
        }
      },
      {
        "box": {
          "id": "scene_s1_send",
          "maxclass": "newobj",
          "patching_rect": [
            655,
            645,
            105,
            22
          ],
          "varname": "scene_s1_send",
          "text": "s s1_gain_cmd"
        }
      },
      {
        "box": {
          "id": "scene_s2_pack",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            685,
            95,
            22
          ],
          "varname": "scene_s2_pack",
          "text": "pack 0. 500"
        }
      },
      {
        "box": {
          "id": "scene_s2_send",
          "maxclass": "newobj",
          "patching_rect": [
            655,
            685,
            105,
            22
          ],
          "varname": "scene_s2_send",
          "text": "s s2_gain_cmd"
        }
      },
      {
        "box": {
          "id": "scene_s3_pack",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            725,
            95,
            22
          ],
          "varname": "scene_s3_pack",
          "text": "pack 0. 500"
        }
      },
      {
        "box": {
          "id": "scene_s3_send",
          "maxclass": "newobj",
          "patching_rect": [
            655,
            725,
            105,
            22
          ],
          "varname": "scene_s3_send",
          "text": "s s3_gain_cmd"
        }
      },
      {
        "box": {
          "id": "scene_return_delay",
          "maxclass": "newobj",
          "patching_rect": [
            395,
            735,
            70,
            22
          ],
          "varname": "scene_return_delay",
          "text": "delay 550"
        }
      },
      {
        "box": {
          "id": "scene_return_play",
          "maxclass": "newobj",
          "patching_rect": [
            485,
            765,
            105,
            22
          ],
          "varname": "scene_return_play",
          "text": "s play_original"
        }
      },
      {
        "box": {
          "id": "scene_display_receive",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            780,
            105,
            22
          ],
          "varname": "scene_display_receive",
          "text": "r nostos_scene"
        }
      },
      {
        "box": {
          "id": "ui_scene_display",
          "maxclass": "number",
          "patching_rect": [
            165,
            780,
            65,
            22
          ],
          "varname": "ui_scene_display",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "presentation": 1,
          "presentation_rect": [
            390,
            175,
            65,
            22
          ]
        }
      },
      {
        "box": {
          "id": "label_scene_display",
          "maxclass": "comment",
          "patching_rect": [
            40,
            750,
            300,
            23
          ],
          "varname": "label_scene_display",
          "text": "当前场景：0待机／1／2／3／4返回",
          "fontsize": 12,
          "fontface": 0,
          "presentation": 1,
          "presentation_rect": [
            390,
            140,
            300,
            23
          ]
        }
      },
      {
        "box": {
          "id": "scene_default",
          "maxclass": "newobj",
          "patching_rect": [
            260,
            780,
            90,
            22
          ],
          "varname": "scene_default",
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "scene_default_send",
          "maxclass": "newobj",
          "patching_rect": [
            370,
            780,
            105,
            22
          ],
          "varname": "scene_default_send",
          "text": "s nostos_scene"
        }
      },
      {
        "box": {
          "id": "label_transform",
          "maxclass": "comment",
          "patching_rect": [
            820,
            520,
            110,
            42
          ],
          "varname": "label_transform",
          "text": "控: TRANSFORM\n0清晰 100强变形",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            545,
            205,
            110,
            40
          ]
        }
      },
      {
        "box": {
          "id": "ui_transform",
          "maxclass": "slider",
          "patching_rect": [
            820,
            575,
            34,
            140
          ],
          "varname": "ui_transform",
          "size": 101,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            560,
            250,
            38,
            190
          ]
        }
      },
      {
        "box": {
          "id": "transform_norm",
          "maxclass": "newobj",
          "patching_rect": [
            870,
            620,
            60,
            22
          ],
          "varname": "transform_norm",
          "text": "/ 100."
        }
      },
      {
        "box": {
          "id": "transform_send",
          "maxclass": "newobj",
          "patching_rect": [
            945,
            620,
            105,
            22
          ],
          "varname": "transform_send",
          "text": "s ctl_transform"
        }
      },
      {
        "box": {
          "id": "transform_receive",
          "maxclass": "newobj",
          "patching_rect": [
            945,
            660,
            105,
            22
          ],
          "varname": "transform_receive",
          "text": "r ctl_transform"
        }
      },
      {
        "box": {
          "id": "transform_value",
          "maxclass": "number",
          "patching_rect": [
            945,
            690,
            65,
            22
          ],
          "varname": "transform_value",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "format": 6,
          "numdecimalplaces": 2,
          "cantchange": 0
        }
      },
      {
        "box": {
          "id": "transform_default",
          "maxclass": "newobj",
          "patching_rect": [
            870,
            730,
            100,
            22
          ],
          "varname": "transform_default",
          "text": "loadmess 25"
        }
      },
      {
        "box": {
          "id": "label_density",
          "maxclass": "comment",
          "patching_rect": [
            1080,
            520,
            110,
            42
          ],
          "varname": "label_density",
          "text": "控: DENSITY\n0稀疏 100密集",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            665,
            205,
            110,
            40
          ]
        }
      },
      {
        "box": {
          "id": "ui_density",
          "maxclass": "slider",
          "patching_rect": [
            1080,
            575,
            34,
            140
          ],
          "varname": "ui_density",
          "size": 101,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            680,
            250,
            38,
            190
          ]
        }
      },
      {
        "box": {
          "id": "density_norm",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            620,
            60,
            22
          ],
          "varname": "density_norm",
          "text": "/ 100."
        }
      },
      {
        "box": {
          "id": "density_send",
          "maxclass": "newobj",
          "patching_rect": [
            1205,
            620,
            105,
            22
          ],
          "varname": "density_send",
          "text": "s ctl_density"
        }
      },
      {
        "box": {
          "id": "density_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1205,
            660,
            105,
            22
          ],
          "varname": "density_receive",
          "text": "r ctl_density"
        }
      },
      {
        "box": {
          "id": "density_value",
          "maxclass": "number",
          "patching_rect": [
            1205,
            690,
            65,
            22
          ],
          "varname": "density_value",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "format": 6,
          "numdecimalplaces": 2,
          "cantchange": 0
        }
      },
      {
        "box": {
          "id": "density_default",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            730,
            100,
            22
          ],
          "varname": "density_default",
          "text": "loadmess 35"
        }
      },
      {
        "box": {
          "id": "label_voice",
          "maxclass": "comment",
          "patching_rect": [
            1340,
            520,
            110,
            42
          ],
          "varname": "label_voice",
          "text": "控: VOICE\n语音存在感",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            785,
            205,
            110,
            40
          ]
        }
      },
      {
        "box": {
          "id": "ui_voice",
          "maxclass": "slider",
          "patching_rect": [
            1340,
            575,
            34,
            140
          ],
          "varname": "ui_voice",
          "size": 101,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            800,
            250,
            38,
            190
          ]
        }
      },
      {
        "box": {
          "id": "voice_norm",
          "maxclass": "newobj",
          "patching_rect": [
            1390,
            620,
            60,
            22
          ],
          "varname": "voice_norm",
          "text": "/ 100."
        }
      },
      {
        "box": {
          "id": "voice_send",
          "maxclass": "newobj",
          "patching_rect": [
            1465,
            620,
            105,
            22
          ],
          "varname": "voice_send",
          "text": "s ctl_voice"
        }
      },
      {
        "box": {
          "id": "voice_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1465,
            660,
            105,
            22
          ],
          "varname": "voice_receive",
          "text": "r ctl_voice"
        }
      },
      {
        "box": {
          "id": "voice_value",
          "maxclass": "number",
          "patching_rect": [
            1465,
            690,
            65,
            22
          ],
          "varname": "voice_value",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "format": 6,
          "numdecimalplaces": 2,
          "cantchange": 0
        }
      },
      {
        "box": {
          "id": "voice_default",
          "maxclass": "newobj",
          "patching_rect": [
            1390,
            730,
            100,
            22
          ],
          "varname": "voice_default",
          "text": "loadmess 75"
        }
      },
      {
        "box": {
          "id": "label_gesture_x",
          "maxclass": "comment",
          "patching_rect": [
            1600,
            520,
            110,
            42
          ],
          "varname": "label_gesture_x",
          "text": "控: X\n左 ↔ 右",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            905,
            205,
            110,
            40
          ]
        }
      },
      {
        "box": {
          "id": "ui_gesture_x",
          "maxclass": "slider",
          "patching_rect": [
            1600,
            575,
            34,
            140
          ],
          "varname": "ui_gesture_x",
          "size": 101,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            920,
            250,
            38,
            190
          ]
        }
      },
      {
        "box": {
          "id": "gesture_x_norm",
          "maxclass": "newobj",
          "patching_rect": [
            1650,
            620,
            60,
            22
          ],
          "varname": "gesture_x_norm",
          "text": "/ 100."
        }
      },
      {
        "box": {
          "id": "gesture_x_send",
          "maxclass": "newobj",
          "patching_rect": [
            1725,
            620,
            105,
            22
          ],
          "varname": "gesture_x_send",
          "text": "s ctl_x"
        }
      },
      {
        "box": {
          "id": "gesture_x_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1725,
            660,
            105,
            22
          ],
          "varname": "gesture_x_receive",
          "text": "r ctl_x"
        }
      },
      {
        "box": {
          "id": "gesture_x_value",
          "maxclass": "number",
          "patching_rect": [
            1725,
            690,
            65,
            22
          ],
          "varname": "gesture_x_value",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "format": 6,
          "numdecimalplaces": 2,
          "cantchange": 0
        }
      },
      {
        "box": {
          "id": "gesture_x_default",
          "maxclass": "newobj",
          "patching_rect": [
            1650,
            730,
            100,
            22
          ],
          "varname": "gesture_x_default",
          "text": "loadmess 50"
        }
      },
      {
        "box": {
          "id": "label_gesture_y",
          "maxclass": "comment",
          "patching_rect": [
            1860,
            520,
            110,
            42
          ],
          "varname": "label_gesture_y",
          "text": "控: Y\n暗 ↔ 亮",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            1025,
            205,
            110,
            40
          ]
        }
      },
      {
        "box": {
          "id": "ui_gesture_y",
          "maxclass": "slider",
          "patching_rect": [
            1860,
            575,
            34,
            140
          ],
          "varname": "ui_gesture_y",
          "size": 101,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            1040,
            250,
            38,
            190
          ]
        }
      },
      {
        "box": {
          "id": "gesture_y_norm",
          "maxclass": "newobj",
          "patching_rect": [
            1910,
            620,
            60,
            22
          ],
          "varname": "gesture_y_norm",
          "text": "/ 100."
        }
      },
      {
        "box": {
          "id": "gesture_y_send",
          "maxclass": "newobj",
          "patching_rect": [
            1985,
            620,
            105,
            22
          ],
          "varname": "gesture_y_send",
          "text": "s ctl_y"
        }
      },
      {
        "box": {
          "id": "gesture_y_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1985,
            660,
            105,
            22
          ],
          "varname": "gesture_y_receive",
          "text": "r ctl_y"
        }
      },
      {
        "box": {
          "id": "gesture_y_value",
          "maxclass": "number",
          "patching_rect": [
            1985,
            690,
            65,
            22
          ],
          "varname": "gesture_y_value",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "format": 6,
          "numdecimalplaces": 2,
          "cantchange": 0
        }
      },
      {
        "box": {
          "id": "gesture_y_default",
          "maxclass": "newobj",
          "patching_rect": [
            1910,
            730,
            100,
            22
          ],
          "varname": "gesture_y_default",
          "text": "loadmess 50"
        }
      },
      {
        "box": {
          "id": "transform_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [945, 760, 125, 22],
          "varname": "transform_raw_receive",
          "text": "r ui_transform_raw"
        }
      },
      {
        "box": {
          "id": "density_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [1205, 760, 115, 22],
          "varname": "density_raw_receive",
          "text": "r ui_density_raw"
        }
      },
      {
        "box": {
          "id": "voice_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [1465, 760, 105, 22],
          "varname": "voice_raw_receive",
          "text": "r ui_voice_raw"
        }
      },
      {
        "box": {
          "id": "gesture_x_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [1725, 760, 85, 22],
          "varname": "gesture_x_raw_receive",
          "text": "r ui_x_raw"
        }
      },
      {
        "box": {
          "id": "gesture_y_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [1985, 760, 85, 22],
          "varname": "gesture_y_raw_receive",
          "text": "r ui_y_raw"
        }
      },
      {
        "box": {
          "id": "ui_event_a",
          "maxclass": "button",
          "patching_rect": [
            40,
            850,
            44,
            44
          ],
          "varname": "ui_event_a",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            300,
            60,
            60
          ]
        }
      },
      {
        "box": {
          "id": "ui_event_b",
          "maxclass": "button",
          "patching_rect": [
            120,
            850,
            44,
            44
          ],
          "varname": "ui_event_b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            110,
            300,
            60,
            60
          ]
        }
      },
      {
        "box": {
          "id": "ui_hold",
          "maxclass": "toggle",
          "patching_rect": [
            200,
            850,
            44,
            44
          ],
          "varname": "ui_hold",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            200,
            300,
            60,
            60
          ]
        }
      },
      {
        "box": {
          "id": "label_events",
          "maxclass": "comment",
          "patching_rect": [
            40,
            820,
            300,
            23
          ],
          "varname": "label_events",
          "text": "控: EVENT A       EVENT B       HOLD",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            20,
            270,
            300,
            23
          ]
        }
      },
      {
        "box": {
          "id": "event_a_send",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            910,
            100,
            22
          ],
          "varname": "event_a_send",
          "text": "s ctl_event_a"
        }
      },
      {
        "box": {
          "id": "event_b_send",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            910,
            100,
            22
          ],
          "varname": "event_b_send",
          "text": "s ctl_event_b"
        }
      },
      {
        "box": {
          "id": "hold_send",
          "maxclass": "newobj",
          "patching_rect": [
            280,
            910,
            90,
            22
          ],
          "varname": "hold_send",
          "text": "s ctl_hold"
        }
      },
      {
        "box": {
          "id": "hold_raw_receive",
          "maxclass": "newobj",
          "patching_rect": [280, 875, 105, 22],
          "varname": "hold_raw_receive",
          "text": "r ui_hold_raw"
        }
      },
      {
        "box": {
          "id": "label_osc_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            2600,
            1200,
            32
          ],
          "varname": "label_osc_section",
          "text": "7｜TouchOSC 配置与路由（平时无需调整）",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [0.2, 0.55, 0.9, 1.0]
        }
      },
      {
        "box": {
          "id": "label_osc",
          "maxclass": "comment",
          "patching_rect": [
            40,
            2638,
            1900,
            35
          ],
          "varname": "label_osc",
          "text": "TouchOSC：UDP 9000；/nostos/stage 1..4，/transform /density /voice，/gesture x y，/event 1|2，/record /play /mute /hold /pause /reset。",
          "fontsize": 12,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "osc_udp",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2690,
            120,
            22
          ],
          "varname": "osc_udp",
          "text": "udpreceive 9000"
        }
      },
      {
        "box": {
          "id": "osc_parse",
          "maxclass": "newobj",
          "patching_rect": [
            180,
            2690,
            70,
            22
          ],
          "varname": "osc_parse",
          "text": "oscparse"
        }
      },
      {
        "box": {
          "id": "osc_trim",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            2690,
            65,
            22
          ],
          "varname": "osc_trim",
          "text": "list trim"
        }
      },
      {
        "box": {
          "id": "osc_root",
          "maxclass": "newobj",
          "patching_rect": [
            355,
            2690,
            95,
            22
          ],
          "varname": "osc_root",
          "text": "route nostos"
        }
      },
      {
        "box": {
          "id": "osc_route",
          "maxclass": "newobj",
          "patching_rect": [
            470,
            2690,
            500,
            22
          ],
          "varname": "osc_route",
          "text": "route stage transform density voice gesture event record play mute hold pause reset"
        }
      },
      {
        "box": {
          "id": "osc_stage_send",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2740,
            105,
            22
          ],
          "varname": "osc_stage_send",
          "text": "s nostos_scene"
        }
      },
      {
        "box": {
          "id": "osc_transform_clip",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            2740,
            70,
            22
          ],
          "varname": "osc_transform_clip",
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "osc_transform_send",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            2780,
            105,
            22
          ],
          "varname": "osc_transform_send",
          "text": "s ctl_transform"
        }
      },
      {
        "box": {
          "id": "osc_density_clip",
          "maxclass": "newobj",
          "patching_rect": [
            300,
            2740,
            70,
            22
          ],
          "varname": "osc_density_clip",
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "osc_density_send",
          "maxclass": "newobj",
          "patching_rect": [
            300,
            2780,
            95,
            22
          ],
          "varname": "osc_density_send",
          "text": "s ctl_density"
        }
      },
      {
        "box": {
          "id": "osc_voice_clip",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            2740,
            70,
            22
          ],
          "varname": "osc_voice_clip",
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "osc_voice_send",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            2780,
            85,
            22
          ],
          "varname": "osc_voice_send",
          "text": "s ctl_voice"
        }
      },
      {
        "box": {
          "id": "osc_xy_unpack",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            2740,
            90,
            22
          ],
          "varname": "osc_xy_unpack",
          "text": "unpack 0. 0."
        }
      },
      {
        "box": {
          "id": "osc_x_send",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            2780,
            65,
            22
          ],
          "varname": "osc_x_send",
          "text": "s ctl_x"
        }
      },
      {
        "box": {
          "id": "osc_y_send",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            2780,
            65,
            22
          ],
          "varname": "osc_y_send",
          "text": "s ctl_y"
        }
      },
      {
        "box": {
          "id": "osc_event_sel",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            2740,
            60,
            22
          ],
          "varname": "osc_event_sel",
          "text": "sel 1 2"
        }
      },
      {
        "box": {
          "id": "osc_event_a_send",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            2780,
            100,
            22
          ],
          "varname": "osc_event_a_send",
          "text": "s ctl_event_a"
        }
      },
      {
        "box": {
          "id": "osc_event_b_send",
          "maxclass": "newobj",
          "patching_rect": [
            820,
            2780,
            100,
            22
          ],
          "varname": "osc_event_b_send",
          "text": "s ctl_event_b"
        }
      },
      {
        "box": {
          "id": "osc_record_send",
          "maxclass": "newobj",
          "patching_rect": [
            940,
            2740,
            100,
            22
          ],
          "varname": "osc_record_send",
          "text": "s rec_control"
        }
      },
      {
        "box": {
          "id": "osc_play_sel",
          "maxclass": "newobj",
          "patching_rect": [
            1060,
            2740,
            45,
            22
          ],
          "varname": "osc_play_sel",
          "text": "sel 1"
        }
      },
      {
        "box": {
          "id": "osc_play_send",
          "maxclass": "newobj",
          "patching_rect": [
            1120,
            2740,
            105,
            22
          ],
          "varname": "osc_play_send",
          "text": "s play_original"
        }
      },
      {
        "box": {
          "id": "osc_mute_send",
          "maxclass": "newobj",
          "patching_rect": [
            1250,
            2740,
            80,
            22
          ],
          "varname": "osc_mute_send",
          "text": "s ctl_mute"
        }
      },
      {
        "box": {
          "id": "osc_hold_send",
          "maxclass": "newobj",
          "patching_rect": [
            1350,
            2740,
            80,
            22
          ],
          "varname": "osc_hold_send",
          "text": "s ctl_hold"
        }
      },
      {
        "box": {
          "id": "osc_pause_send",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            2740,
            85,
            22
          ],
          "varname": "osc_pause_send",
          "text": "s ctl_pause"
        }
      },
      {
        "box": {
          "id": "osc_reset_sel",
          "maxclass": "newobj",
          "patching_rect": [
            1555,
            2740,
            45,
            22
          ],
          "varname": "osc_reset_sel",
          "text": "sel 1"
        }
      },
      {
        "box": {
          "id": "osc_reset_send",
          "maxclass": "newobj",
          "patching_rect": [
            1620,
            2740,
            80,
            22
          ],
          "varname": "osc_reset_send",
          "text": "s ctl_reset"
        }
      },
      {
        "box": {
          "id": "label_debug_remote",
          "maxclass": "comment",
          "patching_rect": [
            420,
            805,
            510,
            23
          ],
          "varname": "label_debug_remote",
          "text": "上方调试遥控｜MASTER、MUTE、DSP（底部仍保留完整输出安全链）",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.35, 0.45, 0.9, 1.0]
        }
      },
      {
        "box": {
          "id": "label_master_remote",
          "maxclass": "comment",
          "patching_rect": [
            420,
            830,
            300,
            23
          ],
          "varname": "label_master_remote",
          "text": "控: MASTER 遥控（-70 至 +6 dB）",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0]
        }
      },
      {
        "box": {
          "id": "ui_master_remote",
          "maxclass": "slider",
          "patching_rect": [
            420,
            860,
            220,
            24
          ],
          "varname": "ui_master_remote",
          "size": 128,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "master_remote_scale",
          "maxclass": "newobj",
          "patching_rect": [
            660,
            860,
            140,
            22
          ],
          "varname": "master_remote_scale",
          "text": "scale 0 127 -70. 6."
        }
      },
      {
        "box": {
          "id": "ui_master_db",
          "maxclass": "flonum",
          "patching_rect": [
            820,
            860,
            70,
            22
          ],
          "varname": "ui_master_db",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "master_remote_send",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            860,
            120,
            22
          ],
          "varname": "master_remote_send",
          "text": "s ctl_master_db"
        }
      },
      {
        "box": {
          "id": "master_remote_default",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            905,
            100,
            22
          ],
          "varname": "master_remote_default",
          "text": "loadmess 97"
        }
      },
      {
        "box": {
          "id": "label_mute_remote",
          "maxclass": "comment",
          "patching_rect": [
            1020,
            800,
            90,
            42
          ],
          "varname": "label_mute_remote",
          "text": "控: MUTE\n紧急静音",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0]
        }
      },
      {
        "box": {
          "id": "ui_mute_remote",
          "maxclass": "toggle",
          "patching_rect": [
            1040,
            850,
            44,
            44
          ],
          "varname": "ui_mute_remote",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "mute_remote_send",
          "maxclass": "newobj",
          "patching_rect": [
            1040,
            910,
            80,
            22
          ],
          "varname": "mute_remote_send",
          "text": "s ctl_mute"
        }
      },
      {
        "box": {
          "id": "label_dsp_remote",
          "maxclass": "comment",
          "patching_rect": [
            1115,
            800,
            60,
            23
          ],
          "varname": "label_dsp_remote",
          "text": "控: DSP",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0]
        }
      },
      {
        "box": {
          "id": "ui_dsp_remote",
          "maxclass": "ezdac~",
          "patching_rect": [
            1120,
            835,
            50,
            50
          ],
          "varname": "ui_dsp_remote",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "mute_remote_state_receive",
          "maxclass": "newobj",
          "patching_rect": [
            660,
            905,
            95,
            22
          ],
          "varname": "mute_remote_state_receive",
          "text": "r ctl_mute"
        }
      },
      {
        "box": {
          "id": "mute_remote_state_set",
          "maxclass": "newobj",
          "patching_rect": [
            775,
            905,
            85,
            22
          ],
          "varname": "mute_remote_state_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "reset_master_receive",
          "maxclass": "newobj",
          "patching_rect": [540, 905, 85, 22],
          "varname": "reset_master_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_master_value",
          "maxclass": "message",
          "patching_rect": [540, 940, 40, 22],
          "varname": "reset_master_value",
          "text": "97",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "reset_mute_receive",
          "maxclass": "newobj",
          "patching_rect": [1040, 945, 85, 22],
          "varname": "reset_mute_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_mute_value",
          "maxclass": "message",
          "patching_rect": [1140, 945, 35, 22],
          "varname": "reset_mute_value",
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "label_pause",
          "maxclass": "comment",
          "patching_rect": [1200, 800, 180, 42],
          "varname": "label_pause",
          "text": "控: PAUSE / CONTINUE\n1暂停 0继续（50 ms淡变）",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [450, 80, 210, 42]
        }
      },
      {
        "box": {
          "id": "ui_pause",
          "maxclass": "toggle",
          "patching_rect": [1220, 850, 44, 44],
          "varname": "ui_pause",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": ["int"],
          "presentation": 1,
          "presentation_rect": [680, 80, 52, 52]
        }
      },
      {
        "box": {
          "id": "pause_send",
          "maxclass": "newobj",
          "patching_rect": [1200, 910, 85, 22],
          "varname": "pause_send",
          "text": "s ctl_pause"
        }
      },
      {
        "box": {
          "id": "pause_state_receive",
          "maxclass": "newobj",
          "patching_rect": [1285, 850, 90, 22],
          "varname": "pause_state_receive",
          "text": "r ctl_pause"
        }
      },
      {
        "box": {
          "id": "pause_state_set",
          "maxclass": "newobj",
          "patching_rect": [1285, 880, 85, 22],
          "varname": "pause_state_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "pause_default",
          "maxclass": "newobj",
          "patching_rect": [1295, 910, 90, 22],
          "varname": "pause_default",
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "reset_pause_receive",
          "maxclass": "newobj",
          "patching_rect": [1200, 945, 85, 22],
          "varname": "reset_pause_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_pause_value",
          "maxclass": "message",
          "patching_rect": [1300, 945, 35, 22],
          "varname": "reset_pause_value",
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "label_reset",
          "maxclass": "comment",
          "patching_rect": [1400, 800, 180, 42],
          "varname": "label_reset",
          "text": "控: RESET\n恢复场景预设，不清除录音",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [760, 80, 220, 42]
        }
      },
      {
        "box": {
          "id": "ui_reset",
          "maxclass": "button",
          "patching_rect": [1420, 850, 44, 44],
          "varname": "ui_reset",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": ["bang"],
          "presentation": 1,
          "presentation_rect": [1000, 80, 52, 52]
        }
      },
      {
        "box": {
          "id": "reset_send",
          "maxclass": "newobj",
          "patching_rect": [1480, 860, 80, 22],
          "varname": "reset_send",
          "text": "s ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_scene_receive",
          "maxclass": "newobj",
          "patching_rect": [1400, 910, 85, 22],
          "varname": "reset_scene_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "reset_scene_value",
          "maxclass": "message",
          "patching_rect": [1500, 910, 35, 22],
          "varname": "reset_scene_value",
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "reset_scene_send",
          "maxclass": "newobj",
          "patching_rect": [1545, 910, 105, 22],
          "varname": "reset_scene_send",
          "text": "s nostos_scene"
        }
      },
      {
        "box": {
          "id": "reset_preset_receive",
          "maxclass": "newobj",
          "patching_rect": [1580, 945, 85, 22],
          "varname": "reset_preset_receive",
          "text": "r ctl_reset"
        }
      },
      {
        "box": {
          "id": "scene_preset_s1",
          "maxclass": "message",
          "patching_rect": [1700, 800, 130, 22],
          "varname": "scene_preset_s1",
          "text": "25 35 75 50 50 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "scene_preset_s2",
          "maxclass": "message",
          "patching_rect": [1700, 830, 130, 22],
          "varname": "scene_preset_s2",
          "text": "70 55 70 50 55 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "scene_preset_s3",
          "maxclass": "message",
          "patching_rect": [1700, 860, 130, 22],
          "varname": "scene_preset_s3",
          "text": "85 30 80 50 45 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "scene_preset_return",
          "maxclass": "message",
          "patching_rect": [1700, 890, 130, 22],
          "varname": "scene_preset_return",
          "text": "0 20 100 50 100 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "scene_preset_reset",
          "maxclass": "message",
          "patching_rect": [1700, 920, 130, 22],
          "varname": "scene_preset_reset",
          "text": "25 35 75 50 50 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [""]
        }
      },
      {
        "box": {
          "id": "scene_preset_unpack",
          "maxclass": "newobj",
          "patching_rect": [1850, 860, 150, 22],
          "varname": "scene_preset_unpack",
          "text": "unpack 0 0 0 0 0 0"
        }
      },
      {
        "box": {
          "id": "preset_transform_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 800, 130, 22],
          "varname": "preset_transform_send",
          "text": "s ui_transform_raw"
        }
      },
      {
        "box": {
          "id": "preset_density_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 830, 120, 22],
          "varname": "preset_density_send",
          "text": "s ui_density_raw"
        }
      },
      {
        "box": {
          "id": "preset_voice_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 860, 110, 22],
          "varname": "preset_voice_send",
          "text": "s ui_voice_raw"
        }
      },
      {
        "box": {
          "id": "preset_x_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 890, 90, 22],
          "varname": "preset_x_send",
          "text": "s ui_x_raw"
        }
      },
      {
        "box": {
          "id": "preset_y_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 920, 90, 22],
          "varname": "preset_y_send",
          "text": "s ui_y_raw"
        }
      },
      {
        "box": {
          "id": "preset_hold_send",
          "maxclass": "newobj",
          "patching_rect": [2020, 950, 100, 22],
          "varname": "preset_hold_send",
          "text": "s ui_hold_raw"
        }
      },
      {
        "box": {
          "id": "label_stage_presets",
          "maxclass": "comment",
          "patching_rect": [1700, 975, 450, 23],
          "varname": "label_stage_presets",
          "text": "Stage预设顺序：TRANSFORM DENSITY VOICE X Y HOLD；切换时自动召回。",
          "fontsize": 11,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "label_s1_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1000,
            1200,
            32
          ],
          "varname": "label_s1_section",
          "text": "3｜第一阶段：出发／战争",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.85,
            0.25,
            0.2,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_s1_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1037,
            1200,
            26
          ],
          "varname": "label_s1_help",
          "text": "TRANSFORM 改变循环速度；DENSITY 改变 55 Hz 底音的脉动速度；EVENT A 倒放 1.2 秒；EVENT B 短暂失速。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "s1_scene",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1100,
            105,
            22
          ],
          "varname": "s1_scene",
          "text": "r nostos_scene"
        }
      },
      {
        "box": {
          "id": "s1_equal",
          "maxclass": "newobj",
          "patching_rect": [
            165,
            1100,
            45,
            22
          ],
          "varname": "s1_equal",
          "text": "== 1"
        }
      },
      {
        "box": {
          "id": "s1_change",
          "maxclass": "newobj",
          "patching_rect": [
            230,
            1100,
            55,
            22
          ],
          "varname": "s1_change",
          "text": "change"
        }
      },
      {
        "box": {
          "id": "s1_sel",
          "maxclass": "newobj",
          "patching_rect": [
            305,
            1100,
            65,
            22
          ],
          "varname": "s1_sel",
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "s1_start",
          "maxclass": "message",
          "patching_rect": [
            390,
            1085,
            65,
            22
          ],
          "varname": "s1_start",
          "text": "startloop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_stop_delay",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            1125,
            75,
            22
          ],
          "varname": "s1_stop_delay",
          "text": "delay 520"
        }
      },
      {
        "box": {
          "id": "s1_stop",
          "maxclass": "message",
          "patching_rect": [
            485,
            1125,
            42,
            22
          ],
          "varname": "s1_stop",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_transform",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1085,
            105,
            22
          ],
          "varname": "s1_transform",
          "text": "r ctl_transform"
        }
      },
      {
        "box": {
          "id": "s1_speed_scale",
          "maxclass": "newobj",
          "patching_rect": [
            725,
            1085,
            140,
            22
          ],
          "varname": "s1_speed_scale",
          "text": "scale 0. 1. 1. 0.45"
        }
      },
      {
        "box": {
          "id": "s1_speed_pack",
          "maxclass": "newobj",
          "patching_rect": [
            885,
            1085,
            90,
            22
          ],
          "varname": "s1_speed_pack",
          "text": "pack 0. 100"
        }
      },
      {
        "box": {
          "id": "s1_speed_line",
          "maxclass": "newobj",
          "patching_rect": [
            995,
            1085,
            60,
            22
          ],
          "varname": "s1_speed_line",
          "text": "line~ 1."
        }
      },
      {
        "box": {
          "id": "s1_duration",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1130,
            125,
            22
          ],
          "varname": "s1_duration",
          "text": "r rec_duration_ms"
        }
      },
      {
        "box": {
          "id": "s1_loop_zero",
          "maxclass": "newobj",
          "patching_rect": [
            745,
            1130,
            90,
            22
          ],
          "varname": "s1_loop_zero",
          "text": "loadmess 0."
        }
      },
      {
        "box": {
          "id": "s1_player",
          "maxclass": "newobj",
          "patching_rect": [
            995,
            1165,
            210,
            22
          ],
          "varname": "s1_player",
          "text": "groove~ nostos_voice 1 @loop 1"
        }
      },
      {
        "box": {
          "id": "s1_voice_static",
          "maxclass": "newobj",
          "patching_rect": [
            1225,
            1165,
            60,
            22
          ],
          "varname": "s1_voice_static",
          "text": "*~ 0.35"
        }
      },
      {
        "box": {
          "id": "s1_voice",
          "maxclass": "newobj",
          "patching_rect": [
            1225,
            1085,
            90,
            22
          ],
          "varname": "s1_voice",
          "text": "r ctl_voice"
        }
      },
      {
        "box": {
          "id": "s1_voice_pack",
          "maxclass": "newobj",
          "patching_rect": [
            1330,
            1085,
            85,
            22
          ],
          "varname": "s1_voice_pack",
          "text": "pack 0. 50"
        }
      },
      {
        "box": {
          "id": "s1_voice_line",
          "maxclass": "newobj",
          "patching_rect": [
            1435,
            1085,
            70,
            22
          ],
          "varname": "s1_voice_line",
          "text": "line~ 0.75"
        }
      },
      {
        "box": {
          "id": "s1_voice_gain",
          "maxclass": "newobj",
          "patching_rect": [
            1320,
            1165,
            35,
            22
          ],
          "varname": "s1_voice_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s1_event_a",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            1195,
            95,
            22
          ],
          "varname": "s1_event_a",
          "text": "r ctl_event_a"
        }
      },
      {
        "box": {
          "id": "s1_reverse",
          "maxclass": "message",
          "patching_rect": [
            715,
            1195,
            55,
            22
          ],
          "varname": "s1_reverse",
          "text": "-1. 60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_reverse_delay",
          "maxclass": "newobj",
          "patching_rect": [
            790,
            1195,
            80,
            22
          ],
          "varname": "s1_reverse_delay",
          "text": "delay 1200"
        }
      },
      {
        "box": {
          "id": "s1_reverse_back",
          "maxclass": "message",
          "patching_rect": [
            890,
            1195,
            55,
            22
          ],
          "varname": "s1_reverse_back",
          "text": "1. 300",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_event_b",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            1235,
            95,
            22
          ],
          "varname": "s1_event_b",
          "text": "r ctl_event_b"
        }
      },
      {
        "box": {
          "id": "s1_lurch",
          "maxclass": "message",
          "patching_rect": [
            715,
            1235,
            60,
            22
          ],
          "varname": "s1_lurch",
          "text": "0.25 60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_lurch_delay",
          "maxclass": "newobj",
          "patching_rect": [
            795,
            1235,
            70,
            22
          ],
          "varname": "s1_lurch_delay",
          "text": "delay 650"
        }
      },
      {
        "box": {
          "id": "s1_lurch_back",
          "maxclass": "message",
          "patching_rect": [
            885,
            1235,
            55,
            22
          ],
          "varname": "s1_lurch_back",
          "text": "1. 250",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s1_density",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1195,
            90,
            22
          ],
          "varname": "s1_density",
          "text": "r ctl_density"
        }
      },
      {
        "box": {
          "id": "s1_rate_scale",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            1195,
            135,
            22
          ],
          "varname": "s1_rate_scale",
          "text": "scale 0. 1. 0.3 4."
        }
      },
      {
        "box": {
          "id": "s1_rate_pack",
          "maxclass": "newobj",
          "patching_rect": [
            305,
            1195,
            80,
            22
          ],
          "varname": "s1_rate_pack",
          "text": "pack 0. 80"
        }
      },
      {
        "box": {
          "id": "s1_rate_line",
          "maxclass": "newobj",
          "patching_rect": [
            405,
            1195,
            65,
            22
          ],
          "varname": "s1_rate_line",
          "text": "line~ 0.8"
        }
      },
      {
        "box": {
          "id": "s1_lfo",
          "maxclass": "newobj",
          "patching_rect": [
            490,
            1195,
            50,
            22
          ],
          "varname": "s1_lfo",
          "text": "cycle~"
        }
      },
      {
        "box": {
          "id": "s1_half",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            1195,
            55,
            22
          ],
          "varname": "s1_half",
          "text": "*~ 0.5"
        }
      },
      {
        "box": {
          "id": "s1_offset",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            1235,
            60,
            22
          ],
          "varname": "s1_offset",
          "text": "+~ 0.5"
        }
      },
      {
        "box": {
          "id": "s1_bed",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            1280,
            75,
            22
          ],
          "varname": "s1_bed",
          "text": "cycle~ 55."
        }
      },
      {
        "box": {
          "id": "s1_bed_level",
          "maxclass": "newobj",
          "patching_rect": [
            250,
            1280,
            60,
            22
          ],
          "varname": "s1_bed_level",
          "text": "*~ 0.09"
        }
      },
      {
        "box": {
          "id": "s1_bed_pulse",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            1280,
            35,
            22
          ],
          "varname": "s1_bed_pulse",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s1_mix",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            1280,
            35,
            22
          ],
          "varname": "s1_mix",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s1_gain_cmd",
          "maxclass": "newobj",
          "patching_rect": [
            1530,
            1205,
            105,
            22
          ],
          "varname": "s1_gain_cmd",
          "text": "r s1_gain_cmd"
        }
      },
      {
        "box": {
          "id": "s1_gain_line",
          "maxclass": "newobj",
          "patching_rect": [
            1655,
            1205,
            60,
            22
          ],
          "varname": "s1_gain_line",
          "text": "line~ 0."
        }
      },
      {
        "box": {
          "id": "s1_gain",
          "maxclass": "newobj",
          "patching_rect": [
            1530,
            1280,
            35,
            22
          ],
          "varname": "s1_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s1_send_l",
          "maxclass": "newobj",
          "patching_rect": [
            1620,
            1265,
            140,
            22
          ],
          "varname": "s1_send_l",
          "text": "send~ nostos_s1_l"
        }
      },
      {
        "box": {
          "id": "s1_send_r",
          "maxclass": "newobj",
          "patching_rect": [
            1620,
            1305,
            140,
            22
          ],
          "varname": "s1_send_r",
          "text": "send~ nostos_s1_r"
        }
      },
      {
        "box": {
          "id": "s1_meter",
          "maxclass": "meter~",
          "patching_rect": [
            1790,
            1250,
            18,
            80
          ],
          "varname": "s1_meter",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "label_s1_chain",
          "maxclass": "comment",
          "patching_rect": [
            995,
            1340,
            800,
            35
          ],
          "varname": "label_s1_chain",
          "text": "groove~ 读取共享 buffer；*~ 0.35 是固定安全增益；VOICE 再控制表现音量；场景 gain 最后决定本模块是否可听。",
          "fontsize": 11,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "label_s2_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1390,
            1200,
            32
          ],
          "varname": "label_s2_section",
          "text": "4｜第二阶段：破碎／漂流",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.55,
            0.3,
            0.8,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_s2_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1427,
            1600,
            26
          ],
          "varname": "label_s2_help",
          "text": "DENSITY 控制自动切片间隔；TRANSFORM 控制切片长度；X 控制声像；Y 控制亮度。EVENT A 立即切片，EVENT B 召回清晰开头，HOLD 重复短残片。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "s2_scene",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1490,
            105,
            22
          ],
          "varname": "s2_scene",
          "text": "r nostos_scene"
        }
      },
      {
        "box": {
          "id": "s2_equal",
          "maxclass": "newobj",
          "patching_rect": [
            165,
            1490,
            45,
            22
          ],
          "varname": "s2_equal",
          "text": "== 2"
        }
      },
      {
        "box": {
          "id": "s2_change",
          "maxclass": "newobj",
          "patching_rect": [
            230,
            1490,
            55,
            22
          ],
          "varname": "s2_change",
          "text": "change"
        }
      },
      {
        "box": {
          "id": "s2_sel",
          "maxclass": "newobj",
          "patching_rect": [
            305,
            1490,
            65,
            22
          ],
          "varname": "s2_sel",
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "s2_metro_on",
          "maxclass": "message",
          "patching_rect": [
            390,
            1460,
            35,
            22
          ],
          "varname": "s2_metro_on",
          "text": "1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s2_metro_off",
          "maxclass": "message",
          "patching_rect": [
            440,
            1460,
            35,
            22
          ],
          "varname": "s2_metro_off",
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s2_metro",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            1490,
            70,
            22
          ],
          "varname": "s2_metro",
          "text": "metro 700"
        }
      },
      {
        "box": {
          "id": "s2_density",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1545,
            90,
            22
          ],
          "varname": "s2_density",
          "text": "r ctl_density"
        }
      },
      {
        "box": {
          "id": "s2_interval_scale",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            1545,
            165,
            22
          ],
          "varname": "s2_interval_scale",
          "text": "scale 0. 1. 1200. 160."
        }
      },
      {
        "box": {
          "id": "s2_interval_int",
          "maxclass": "newobj",
          "patching_rect": [
            335,
            1545,
            30,
            22
          ],
          "varname": "s2_interval_int",
          "text": "i"
        }
      },
      {
        "box": {
          "id": "s2_event_a",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            1545,
            95,
            22
          ],
          "varname": "s2_event_a",
          "text": "r ctl_event_a"
        }
      },
      {
        "box": {
          "id": "s2_trigger",
          "maxclass": "newobj",
          "patching_rect": [
            510,
            1525,
            55,
            22
          ],
          "varname": "s2_trigger",
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "s2_rand_len",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1490,
            80,
            22
          ],
          "varname": "s2_rand_len",
          "text": "random 100"
        }
      },
      {
        "box": {
          "id": "s2_len_plus",
          "maxclass": "newobj",
          "patching_rect": [
            700,
            1490,
            55,
            22
          ],
          "varname": "s2_len_plus",
          "text": "+ 500"
        }
      },
      {
        "box": {
          "id": "s2_transform",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1530,
            105,
            22
          ],
          "varname": "s2_transform",
          "text": "r ctl_transform"
        }
      },
      {
        "box": {
          "id": "s2_len_scale",
          "maxclass": "newobj",
          "patching_rect": [
            725,
            1530,
            165,
            22
          ],
          "varname": "s2_len_scale",
          "text": "scale 0. 1. 900. 120."
        }
      },
      {
        "box": {
          "id": "s2_len_int",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            1530,
            30,
            22
          ],
          "varname": "s2_len_int",
          "text": "i"
        }
      },
      {
        "box": {
          "id": "s2_duration",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1570,
            125,
            22
          ],
          "varname": "s2_duration",
          "text": "r rec_duration_ms"
        }
      },
      {
        "box": {
          "id": "s2_duration_scale",
          "maxclass": "newobj",
          "patching_rect": [
            745,
            1570,
            60,
            22
          ],
          "varname": "s2_duration_scale",
          "text": "* 0.85"
        }
      },
      {
        "box": {
          "id": "s2_duration_int",
          "maxclass": "newobj",
          "patching_rect": [
            825,
            1570,
            30,
            22
          ],
          "varname": "s2_duration_int",
          "text": "i"
        }
      },
      {
        "box": {
          "id": "s2_duration_min",
          "maxclass": "newobj",
          "patching_rect": [
            875,
            1570,
            95,
            22
          ],
          "varname": "s2_duration_min",
          "text": "maximum 500"
        }
      },
      {
        "box": {
          "id": "s2_rand_start",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1610,
            90,
            22
          ],
          "varname": "s2_rand_start",
          "text": "random 9000"
        }
      },
      {
        "box": {
          "id": "s2_start_len",
          "maxclass": "newobj",
          "patching_rect": [
            710,
            1610,
            85,
            22
          ],
          "varname": "s2_start_len",
          "text": "pack 0 500"
        }
      },
      {
        "box": {
          "id": "s2_order",
          "maxclass": "newobj",
          "patching_rect": [
            815,
            1610,
            50,
            22
          ],
          "varname": "s2_order",
          "text": "t l l"
        }
      },
      {
        "box": {
          "id": "s2_calc",
          "maxclass": "newobj",
          "patching_rect": [
            980,
            1570,
            90,
            22
          ],
          "varname": "s2_calc",
          "text": "unpack 0 0"
        }
      },
      {
        "box": {
          "id": "s2_end",
          "maxclass": "newobj",
          "patching_rect": [
            1090,
            1570,
            35,
            22
          ],
          "varname": "s2_end",
          "text": "+"
        }
      },
      {
        "box": {
          "id": "s2_start_only",
          "maxclass": "newobj",
          "patching_rect": [
            885,
            1630,
            90,
            22
          ],
          "varname": "s2_start_only",
          "text": "unpack 0 0"
        }
      },
      {
        "box": {
          "id": "s2_start_end",
          "maxclass": "newobj",
          "patching_rect": [
            1035,
            1610,
            75,
            22
          ],
          "varname": "s2_start_end",
          "text": "pack 0 0"
        }
      },
      {
        "box": {
          "id": "s2_prepend",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            1610,
            95,
            22
          ],
          "varname": "s2_prepend",
          "text": "prepend start"
        }
      },
      {
        "box": {
          "id": "s2_player",
          "maxclass": "newobj",
          "patching_rect": [
            1245,
            1610,
            130,
            22
          ],
          "varname": "s2_player",
          "text": "play~ nostos_voice"
        }
      },
      {
        "box": {
          "id": "s2_y",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            1490,
            65,
            22
          ],
          "varname": "s2_y",
          "text": "r ctl_y"
        }
      },
      {
        "box": {
          "id": "s2_cut_scale",
          "maxclass": "newobj",
          "patching_rect": [
            1215,
            1490,
            155,
            22
          ],
          "varname": "s2_cut_scale",
          "text": "scale 0. 1. 500. 6000."
        }
      },
      {
        "box": {
          "id": "s2_cut_pack",
          "maxclass": "newobj",
          "patching_rect": [
            1390,
            1490,
            80,
            22
          ],
          "varname": "s2_cut_pack",
          "text": "pack 0. 80"
        }
      },
      {
        "box": {
          "id": "s2_cut_line",
          "maxclass": "newobj",
          "patching_rect": [
            1490,
            1490,
            80,
            22
          ],
          "varname": "s2_cut_line",
          "text": "line~ 2500."
        }
      },
      {
        "box": {
          "id": "s2_filter",
          "maxclass": "newobj",
          "patching_rect": [
            1400,
            1610,
            135,
            22
          ],
          "varname": "s2_filter",
          "text": "lores~ 2500. 0.35"
        }
      },
      {
        "box": {
          "id": "s2_slice_level",
          "maxclass": "newobj",
          "patching_rect": [
            1555,
            1610,
            60,
            22
          ],
          "varname": "s2_slice_level",
          "text": "*~ 0.32"
        }
      },
      {
        "box": {
          "id": "s2_event_b",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            1530,
            95,
            22
          ],
          "varname": "s2_event_b",
          "text": "r ctl_event_b"
        }
      },
      {
        "box": {
          "id": "s2_recall",
          "maxclass": "message",
          "patching_rect": [
            1245,
            1530,
            90,
            22
          ],
          "varname": "s2_recall",
          "text": "start 0 1800",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s2_recall_player",
          "maxclass": "newobj",
          "patching_rect": [
            1355,
            1530,
            130,
            22
          ],
          "varname": "s2_recall_player",
          "text": "play~ nostos_voice"
        }
      },
      {
        "box": {
          "id": "s2_recall_level",
          "maxclass": "newobj",
          "patching_rect": [
            1505,
            1530,
            60,
            22
          ],
          "varname": "s2_recall_level",
          "text": "*~ 0.28"
        }
      },
      {
        "box": {
          "id": "s2_hold",
          "maxclass": "newobj",
          "patching_rect": [
            1130,
            1570,
            80,
            22
          ],
          "varname": "s2_hold",
          "text": "r ctl_hold"
        }
      },
      {
        "box": {
          "id": "s2_hold_sel",
          "maxclass": "newobj",
          "patching_rect": [
            1230,
            1570,
            65,
            22
          ],
          "varname": "s2_hold_sel",
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "s2_hold_start",
          "maxclass": "message",
          "patching_rect": [
            1315,
            1640,
            65,
            22
          ],
          "varname": "s2_hold_start",
          "text": "startloop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s2_hold_stop",
          "maxclass": "message",
          "patching_rect": [
            1315,
            1675,
            42,
            22
          ],
          "varname": "s2_hold_stop",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s2_hold_speed",
          "maxclass": "newobj",
          "patching_rect": [
            1400,
            1560,
            65,
            22
          ],
          "varname": "s2_hold_speed",
          "text": "sig~ 0.75"
        }
      },
      {
        "box": {
          "id": "s2_hold_zero",
          "maxclass": "newobj",
          "patching_rect": [
            1485,
            1640,
            90,
            22
          ],
          "varname": "s2_hold_zero",
          "text": "loadmess 0."
        }
      },
      {
        "box": {
          "id": "s2_hold_end",
          "maxclass": "newobj",
          "patching_rect": [
            1485,
            1675,
            95,
            22
          ],
          "varname": "s2_hold_end",
          "text": "loadmess 700."
        }
      },
      {
        "box": {
          "id": "s2_hold_player",
          "maxclass": "newobj",
          "patching_rect": [
            1600,
            1570,
            210,
            22
          ],
          "varname": "s2_hold_player",
          "text": "groove~ nostos_voice 1 @loop 1"
        }
      },
      {
        "box": {
          "id": "s2_hold_level",
          "maxclass": "newobj",
          "patching_rect": [
            1830,
            1570,
            60,
            22
          ],
          "varname": "s2_hold_level",
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "s2_add_a",
          "maxclass": "newobj",
          "patching_rect": [
            1640,
            1655,
            35,
            22
          ],
          "varname": "s2_add_a",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s2_add_b",
          "maxclass": "newobj",
          "patching_rect": [
            1710,
            1655,
            35,
            22
          ],
          "varname": "s2_add_b",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s2_voice",
          "maxclass": "newobj",
          "patching_rect": [
            1780,
            1655,
            90,
            22
          ],
          "varname": "s2_voice",
          "text": "r ctl_voice"
        }
      },
      {
        "box": {
          "id": "s2_voice_pack",
          "maxclass": "newobj",
          "patching_rect": [
            1890,
            1655,
            85,
            22
          ],
          "varname": "s2_voice_pack",
          "text": "pack 0. 50"
        }
      },
      {
        "box": {
          "id": "s2_voice_line",
          "maxclass": "newobj",
          "patching_rect": [
            1995,
            1655,
            70,
            22
          ],
          "varname": "s2_voice_line",
          "text": "line~ 0.75"
        }
      },
      {
        "box": {
          "id": "s2_voice_gain",
          "maxclass": "newobj",
          "patching_rect": [
            1780,
            1700,
            35,
            22
          ],
          "varname": "s2_voice_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s2_x",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1620,
            65,
            22
          ],
          "varname": "s2_x",
          "text": "r ctl_x"
        }
      },
      {
        "box": {
          "id": "s2_x_pack",
          "maxclass": "newobj",
          "patching_rect": [
            125,
            1620,
            80,
            22
          ],
          "varname": "s2_x_pack",
          "text": "pack 0. 60"
        }
      },
      {
        "box": {
          "id": "s2_x_line",
          "maxclass": "newobj",
          "patching_rect": [
            225,
            1620,
            70,
            22
          ],
          "varname": "s2_x_line",
          "text": "line~ 0.5"
        }
      },
      {
        "box": {
          "id": "s2_inv_mul",
          "maxclass": "newobj",
          "patching_rect": [
            315,
            1620,
            55,
            22
          ],
          "varname": "s2_inv_mul",
          "text": "*~ -1."
        }
      },
      {
        "box": {
          "id": "s2_inv_add",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            1620,
            55,
            22
          ],
          "varname": "s2_inv_add",
          "text": "+~ 1."
        }
      },
      {
        "box": {
          "id": "s2_pan_l",
          "maxclass": "newobj",
          "patching_rect": [
            470,
            1685,
            35,
            22
          ],
          "varname": "s2_pan_l",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s2_pan_r",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            1685,
            35,
            22
          ],
          "varname": "s2_pan_r",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s2_noise",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1710,
            55,
            22
          ],
          "varname": "s2_noise",
          "text": "noise~"
        }
      },
      {
        "box": {
          "id": "s2_noise_filter",
          "maxclass": "newobj",
          "patching_rect": [
            115,
            1710,
            120,
            22
          ],
          "varname": "s2_noise_filter",
          "text": "lores~ 240. 0.3"
        }
      },
      {
        "box": {
          "id": "s2_noise_level",
          "maxclass": "newobj",
          "patching_rect": [
            255,
            1710,
            60,
            22
          ],
          "varname": "s2_noise_level",
          "text": "*~ 0.04"
        }
      },
      {
        "box": {
          "id": "s2_mix_l",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            1685,
            35,
            22
          ],
          "varname": "s2_mix_l",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s2_mix_r",
          "maxclass": "newobj",
          "patching_rect": [
            720,
            1685,
            35,
            22
          ],
          "varname": "s2_mix_r",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s2_gain_cmd",
          "maxclass": "newobj",
          "patching_rect": [
            800,
            1710,
            105,
            22
          ],
          "varname": "s2_gain_cmd",
          "text": "r s2_gain_cmd"
        }
      },
      {
        "box": {
          "id": "s2_gain_line",
          "maxclass": "newobj",
          "patching_rect": [
            925,
            1710,
            60,
            22
          ],
          "varname": "s2_gain_line",
          "text": "line~ 0."
        }
      },
      {
        "box": {
          "id": "s2_gain_l",
          "maxclass": "newobj",
          "patching_rect": [
            1010,
            1685,
            35,
            22
          ],
          "varname": "s2_gain_l",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s2_gain_r",
          "maxclass": "newobj",
          "patching_rect": [
            1010,
            1725,
            35,
            22
          ],
          "varname": "s2_gain_r",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s2_send_l",
          "maxclass": "newobj",
          "patching_rect": [
            1080,
            1675,
            140,
            22
          ],
          "varname": "s2_send_l",
          "text": "send~ nostos_s2_l"
        }
      },
      {
        "box": {
          "id": "s2_send_r",
          "maxclass": "newobj",
          "patching_rect": [
            1080,
            1725,
            140,
            22
          ],
          "varname": "s2_send_r",
          "text": "send~ nostos_s2_r"
        }
      },
      {
        "box": {
          "id": "s2_meter_l",
          "maxclass": "meter~",
          "patching_rect": [
            1245,
            1675,
            18,
            80
          ],
          "varname": "s2_meter_l",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "s2_meter_r",
          "maxclass": "meter~",
          "patching_rect": [
            1275,
            1675,
            18,
            80
          ],
          "varname": "s2_meter_r",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "label_s2_chain",
          "maxclass": "comment",
          "patching_rect": [
            1320,
            1740,
            730,
            35
          ],
          "varname": "label_s2_chain",
          "text": "切片用 trigger 保证先计算 end，再由 start 触发 pack；X 通过互补增益完成简单立体声声像。",
          "fontsize": 11,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "label_s3_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1780,
            1200,
            32
          ],
          "varname": "label_s3_section",
          "text": "5｜第三阶段：重组／归返",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.15,
            0.65,
            0.4,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_s3_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1817,
            1350,
            26
          ],
          "varname": "label_s3_help",
          "text": "把 TRANSFORM 从高位拉向 0：速度回到 1、滤波打开、语言恢复。EVENT A 触发 3 秒显现；EVENT B 召回清晰开头。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "s3_scene",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            1880,
            105,
            22
          ],
          "varname": "s3_scene",
          "text": "r nostos_scene"
        }
      },
      {
        "box": {
          "id": "s3_equal",
          "maxclass": "newobj",
          "patching_rect": [
            165,
            1880,
            45,
            22
          ],
          "varname": "s3_equal",
          "text": "== 3"
        }
      },
      {
        "box": {
          "id": "s3_change",
          "maxclass": "newobj",
          "patching_rect": [
            230,
            1880,
            55,
            22
          ],
          "varname": "s3_change",
          "text": "change"
        }
      },
      {
        "box": {
          "id": "s3_sel",
          "maxclass": "newobj",
          "patching_rect": [
            305,
            1880,
            65,
            22
          ],
          "varname": "s3_sel",
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "s3_start",
          "maxclass": "message",
          "patching_rect": [
            390,
            1865,
            65,
            22
          ],
          "varname": "s3_start",
          "text": "startloop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s3_stop_delay",
          "maxclass": "newobj",
          "patching_rect": [
            390,
            1905,
            75,
            22
          ],
          "varname": "s3_stop_delay",
          "text": "delay 520"
        }
      },
      {
        "box": {
          "id": "s3_stop",
          "maxclass": "message",
          "patching_rect": [
            485,
            1905,
            42,
            22
          ],
          "varname": "s3_stop",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s3_transform",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1865,
            105,
            22
          ],
          "varname": "s3_transform",
          "text": "r ctl_transform"
        }
      },
      {
        "box": {
          "id": "s3_speed_scale",
          "maxclass": "newobj",
          "patching_rect": [
            725,
            1865,
            145,
            22
          ],
          "varname": "s3_speed_scale",
          "text": "scale 0. 1. 1. 0.65"
        }
      },
      {
        "box": {
          "id": "s3_speed_pack",
          "maxclass": "newobj",
          "patching_rect": [
            890,
            1865,
            90,
            22
          ],
          "varname": "s3_speed_pack",
          "text": "pack 0. 100"
        }
      },
      {
        "box": {
          "id": "s3_speed_line",
          "maxclass": "newobj",
          "patching_rect": [
            1000,
            1865,
            60,
            22
          ],
          "varname": "s3_speed_line",
          "text": "line~ 1."
        }
      },
      {
        "box": {
          "id": "s3_cut_scale",
          "maxclass": "newobj",
          "patching_rect": [
            725,
            1905,
            165,
            22
          ],
          "varname": "s3_cut_scale",
          "text": "scale 0. 1. 6000. 350."
        }
      },
      {
        "box": {
          "id": "s3_cut_pack",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            1905,
            90,
            22
          ],
          "varname": "s3_cut_pack",
          "text": "pack 0. 100"
        }
      },
      {
        "box": {
          "id": "s3_cut_line",
          "maxclass": "newobj",
          "patching_rect": [
            1020,
            1905,
            80,
            22
          ],
          "varname": "s3_cut_line",
          "text": "line~ 6000."
        }
      },
      {
        "box": {
          "id": "s3_duration",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            1950,
            125,
            22
          ],
          "varname": "s3_duration",
          "text": "r rec_duration_ms"
        }
      },
      {
        "box": {
          "id": "s3_zero",
          "maxclass": "newobj",
          "patching_rect": [
            745,
            1950,
            90,
            22
          ],
          "varname": "s3_zero",
          "text": "loadmess 0."
        }
      },
      {
        "box": {
          "id": "s3_player",
          "maxclass": "newobj",
          "patching_rect": [
            1000,
            1990,
            210,
            22
          ],
          "varname": "s3_player",
          "text": "groove~ nostos_voice 1 @loop 1"
        }
      },
      {
        "box": {
          "id": "s3_filter",
          "maxclass": "newobj",
          "patching_rect": [
            1240,
            1990,
            125,
            22
          ],
          "varname": "s3_filter",
          "text": "lores~ 6000. 0.4"
        }
      },
      {
        "box": {
          "id": "s3_static",
          "maxclass": "newobj",
          "patching_rect": [
            1390,
            1990,
            60,
            22
          ],
          "varname": "s3_static",
          "text": "*~ 0.38"
        }
      },
      {
        "box": {
          "id": "s3_voice",
          "maxclass": "newobj",
          "patching_rect": [
            1240,
            1865,
            90,
            22
          ],
          "varname": "s3_voice",
          "text": "r ctl_voice"
        }
      },
      {
        "box": {
          "id": "s3_voice_pack",
          "maxclass": "newobj",
          "patching_rect": [
            1350,
            1865,
            85,
            22
          ],
          "varname": "s3_voice_pack",
          "text": "pack 0. 50"
        }
      },
      {
        "box": {
          "id": "s3_voice_line",
          "maxclass": "newobj",
          "patching_rect": [
            1455,
            1865,
            70,
            22
          ],
          "varname": "s3_voice_line",
          "text": "line~ 0.75"
        }
      },
      {
        "box": {
          "id": "s3_voice_gain",
          "maxclass": "newobj",
          "patching_rect": [
            1480,
            1990,
            35,
            22
          ],
          "varname": "s3_voice_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s3_event_a",
          "maxclass": "newobj",
          "patching_rect": [
            1240,
            1910,
            95,
            22
          ],
          "varname": "s3_event_a",
          "text": "r ctl_event_a"
        }
      },
      {
        "box": {
          "id": "s3_oracle",
          "maxclass": "message",
          "patching_rect": [
            1355,
            1910,
            125,
            22
          ],
          "varname": "s3_oracle",
          "text": "350., 5200. 3000",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s3_event_b",
          "maxclass": "newobj",
          "patching_rect": [
            1240,
            1950,
            95,
            22
          ],
          "varname": "s3_event_b",
          "text": "r ctl_event_b"
        }
      },
      {
        "box": {
          "id": "s3_recall",
          "maxclass": "message",
          "patching_rect": [
            1355,
            1950,
            90,
            22
          ],
          "varname": "s3_recall",
          "text": "start 0 1800",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "s3_recall_player",
          "maxclass": "newobj",
          "patching_rect": [
            1470,
            1950,
            130,
            22
          ],
          "varname": "s3_recall_player",
          "text": "play~ nostos_voice"
        }
      },
      {
        "box": {
          "id": "s3_recall_level",
          "maxclass": "newobj",
          "patching_rect": [
            1620,
            1950,
            60,
            22
          ],
          "varname": "s3_recall_level",
          "text": "*~ 0.25"
        }
      },
      {
        "box": {
          "id": "s3_voice_mix",
          "maxclass": "newobj",
          "patching_rect": [
            1580,
            1990,
            35,
            22
          ],
          "varname": "s3_voice_mix",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s3_bed_a",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            2020,
            90,
            22
          ],
          "varname": "s3_bed_a",
          "text": "cycle~ 73.42"
        }
      },
      {
        "box": {
          "id": "s3_bed_b",
          "maxclass": "newobj",
          "patching_rect": [
            260,
            2020,
            85,
            22
          ],
          "varname": "s3_bed_b",
          "text": "cycle~ 110."
        }
      },
      {
        "box": {
          "id": "s3_bed_a_level",
          "maxclass": "newobj",
          "patching_rect": [
            370,
            2005,
            60,
            22
          ],
          "varname": "s3_bed_a_level",
          "text": "*~ 0.04"
        }
      },
      {
        "box": {
          "id": "s3_bed_b_level",
          "maxclass": "newobj",
          "patching_rect": [
            370,
            2045,
            60,
            22
          ],
          "varname": "s3_bed_b_level",
          "text": "*~ 0.02"
        }
      },
      {
        "box": {
          "id": "s3_bed_mix",
          "maxclass": "newobj",
          "patching_rect": [
            455,
            2025,
            35,
            22
          ],
          "varname": "s3_bed_mix",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s3_mix",
          "maxclass": "newobj",
          "patching_rect": [
            1700,
            2040,
            35,
            22
          ],
          "varname": "s3_mix",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "s3_gain_cmd",
          "maxclass": "newobj",
          "patching_rect": [
            1770,
            1965,
            105,
            22
          ],
          "varname": "s3_gain_cmd",
          "text": "r s3_gain_cmd"
        }
      },
      {
        "box": {
          "id": "s3_gain_line",
          "maxclass": "newobj",
          "patching_rect": [
            1895,
            1965,
            60,
            22
          ],
          "varname": "s3_gain_line",
          "text": "line~ 0."
        }
      },
      {
        "box": {
          "id": "s3_gain",
          "maxclass": "newobj",
          "patching_rect": [
            1770,
            2040,
            35,
            22
          ],
          "varname": "s3_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "s3_send_l",
          "maxclass": "newobj",
          "patching_rect": [
            1850,
            2025,
            140,
            22
          ],
          "varname": "s3_send_l",
          "text": "send~ nostos_s3_l"
        }
      },
      {
        "box": {
          "id": "s3_send_r",
          "maxclass": "newobj",
          "patching_rect": [
            1850,
            2065,
            140,
            22
          ],
          "varname": "s3_send_r",
          "text": "send~ nostos_s3_r"
        }
      },
      {
        "box": {
          "id": "s3_meter",
          "maxclass": "meter~",
          "patching_rect": [
            2020,
            2015,
            18,
            80
          ],
          "varname": "s3_meter",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "label_s3_chain",
          "maxclass": "comment",
          "patching_rect": [
            1000,
            2115,
            850,
            30
          ],
          "varname": "label_s3_chain",
          "text": "TRANSFORM 同时映射速度与截止频率，因此一个推子就能产生清楚的“从破碎到归返”。",
          "fontsize": 11,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "label_output_section",
          "maxclass": "comment",
          "patching_rect": [
            40,
            2160,
            1200,
            32
          ],
          "varname": "label_output_section",
          "text": "6｜统一混音、安全输出与紧急静音",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.15,
            0.55,
            0.55,
            1
          ]
        }
      },
      {
        "box": {
          "id": "label_output_help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            2197,
            1450,
            26
          ],
          "varname": "label_output_help",
          "text": "所有声音只从这里进入扬声器：接收 → 相加 → MASTER → clip~ → 20 ms MUTE 斜坡 → meter~ → ezdac~。异常时立即按 MUTE。",
          "fontsize": 13,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "out_original_l",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2260,
            170,
            22
          ],
          "varname": "out_original_l",
          "text": "receive~ nostos_original_l"
        }
      },
      {
        "box": {
          "id": "out_original_r",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            2260,
            170,
            22
          ],
          "varname": "out_original_r",
          "text": "receive~ nostos_original_r"
        }
      },
      {
        "box": {
          "id": "out_s1_l",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2300,
            150,
            22
          ],
          "varname": "out_s1_l",
          "text": "receive~ nostos_s1_l"
        }
      },
      {
        "box": {
          "id": "out_s1_r",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            2300,
            150,
            22
          ],
          "varname": "out_s1_r",
          "text": "receive~ nostos_s1_r"
        }
      },
      {
        "box": {
          "id": "out_s2_l",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2340,
            150,
            22
          ],
          "varname": "out_s2_l",
          "text": "receive~ nostos_s2_l"
        }
      },
      {
        "box": {
          "id": "out_s2_r",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            2340,
            150,
            22
          ],
          "varname": "out_s2_r",
          "text": "receive~ nostos_s2_r"
        }
      },
      {
        "box": {
          "id": "out_s3_l",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            2380,
            150,
            22
          ],
          "varname": "out_s3_l",
          "text": "receive~ nostos_s3_l"
        }
      },
      {
        "box": {
          "id": "out_s3_r",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            2380,
            150,
            22
          ],
          "varname": "out_s3_r",
          "text": "receive~ nostos_s3_r"
        }
      },
      {
        "box": {
          "id": "out_l_add1",
          "maxclass": "newobj",
          "patching_rect": [
            235,
            2280,
            35,
            22
          ],
          "varname": "out_l_add1",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_l_add2",
          "maxclass": "newobj",
          "patching_rect": [
            305,
            2320,
            35,
            22
          ],
          "varname": "out_l_add2",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_l_add3",
          "maxclass": "newobj",
          "patching_rect": [
            375,
            2360,
            35,
            22
          ],
          "varname": "out_l_add3",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_r_add1",
          "maxclass": "newobj",
          "patching_rect": [
            695,
            2280,
            35,
            22
          ],
          "varname": "out_r_add1",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_r_add2",
          "maxclass": "newobj",
          "patching_rect": [
            765,
            2320,
            35,
            22
          ],
          "varname": "out_r_add2",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_r_add3",
          "maxclass": "newobj",
          "patching_rect": [
            835,
            2360,
            35,
            22
          ],
          "varname": "out_r_add3",
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "out_pause_gain_l",
          "maxclass": "newobj",
          "patching_rect": [900, 2280, 35, 22],
          "varname": "out_pause_gain_l",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "out_pause_gain_r",
          "maxclass": "newobj",
          "patching_rect": [900, 2330, 35, 22],
          "varname": "out_pause_gain_r",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "out_master",
          "maxclass": "live.gain~",
          "patching_rect": [
            950,
            2250,
            52,
            150
          ],
          "varname": "out_master",
          "lastchannelcount": 0,
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
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Nostos Master",
              "parameter_shortname": "MASTER",
              "parameter_mmax": 6,
              "parameter_mmin": -70,
              "parameter_modmode": 0,
              "parameter_initial": [
                -12.0
              ],
              "parameter_initial_enable": 1,
              "parameter_type": 0,
              "parameter_unitstyle": 4
            }
          },
          "presentation": 1,
          "presentation_rect": [
            1180,
            250,
            55,
            180
          ]
        }
      },
      {
        "box": {
          "id": "out_master_default",
          "maxclass": "comment",
          "patching_rect": [
            1025,
            2250,
            235,
            22
          ],
          "varname": "out_master_default",
          "text": "控: MASTER 总音量（默认 -12 dB）",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            1140,
            215,
            210,
            23
          ]
        }
      },
      {
        "box": {
          "id": "master_remote_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1025,
            2380,
            120,
            22
          ],
          "varname": "master_remote_receive",
          "text": "r ctl_master_db"
        }
      },
      {
        "box": {
          "id": "out_clip_l",
          "maxclass": "newobj",
          "patching_rect": [
            1120,
            2280,
            100,
            22
          ],
          "varname": "out_clip_l",
          "text": "clip~ -0.9 0.9"
        }
      },
      {
        "box": {
          "id": "out_clip_r",
          "maxclass": "newobj",
          "patching_rect": [
            1120,
            2330,
            100,
            22
          ],
          "varname": "out_clip_r",
          "text": "clip~ -0.9 0.9"
        }
      },
      {
        "box": {
          "id": "ui_mute",
          "maxclass": "toggle",
          "patching_rect": [
            1280,
            2250,
            44,
            44
          ],
          "varname": "ui_mute",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            1170,
            80,
            60,
            60
          ]
        }
      },
      {
        "box": {
          "id": "label_mute",
          "maxclass": "comment",
          "patching_rect": [
            1340,
            2250,
            180,
            42
          ],
          "varname": "label_mute",
          "text": "控: EMERGENCY MUTE\n1=静音",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            1240,
            85,
            210,
            42
          ]
        }
      },
      {
        "box": {
          "id": "out_mute_send",
          "maxclass": "newobj",
          "patching_rect": [
            1280,
            2310,
            80,
            22
          ],
          "varname": "out_mute_send",
          "text": "s ctl_mute"
        }
      },
      {
        "box": {
          "id": "mute_bottom_state_set",
          "maxclass": "newobj",
          "patching_rect": [
            1380,
            2310,
            85,
            22
          ],
          "varname": "mute_bottom_state_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "out_mute_receive",
          "maxclass": "newobj",
          "patching_rect": [
            1280,
            2350,
            80,
            22
          ],
          "varname": "out_mute_receive",
          "text": "r ctl_mute"
        }
      },
      {
        "box": {
          "id": "out_invert",
          "maxclass": "newobj",
          "patching_rect": [
            1380,
            2350,
            45,
            22
          ],
          "varname": "out_invert",
          "text": "!- 1"
        }
      },
      {
        "box": {
          "id": "out_mute_pack",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            2350,
            75,
            22
          ],
          "varname": "out_mute_pack",
          "text": "pack 0 20"
        }
      },
      {
        "box": {
          "id": "out_mute_line",
          "maxclass": "newobj",
          "patching_rect": [
            1545,
            2350,
            60,
            22
          ],
          "varname": "out_mute_line",
          "text": "line~ 1."
        }
      },
      {
        "box": {
          "id": "out_gain_l",
          "maxclass": "newobj",
          "patching_rect": [
            1260,
            2420,
            35,
            22
          ],
          "varname": "out_gain_l",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "out_gain_r",
          "maxclass": "newobj",
          "patching_rect": [
            1260,
            2470,
            35,
            22
          ],
          "varname": "out_gain_r",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "out_meter_l",
          "maxclass": "meter~",
          "patching_rect": [
            1340,
            2400,
            18,
            80
          ],
          "varname": "out_meter_l",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "out_meter_r",
          "maxclass": "meter~",
          "patching_rect": [
            1380,
            2400,
            18,
            80
          ],
          "varname": "out_meter_r",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "out_dac",
          "maxclass": "ezdac~",
          "patching_rect": [
            1480,
            2415,
            55,
            55
          ],
          "varname": "out_dac",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "presentation": 1,
          "presentation_rect": [
            1280,
            360,
            60,
            60
          ]
        }
      },
      {
        "box": {
          "id": "label_dsp",
          "maxclass": "comment",
          "patching_rect": [
            1450,
            2490,
            260,
            23
          ],
          "varname": "label_dsp",
          "text": "控: 点击扬声器开启／关闭 DSP",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [0.65, 0.2, 0.85, 1.0],
          "presentation": 1,
          "presentation_rect": [
            1240,
            435,
            280,
            23
          ]
        }
      },
      {
        "box": {
          "id": "out_mute_default",
          "maxclass": "newobj",
          "patching_rect": [
            1280,
            2540,
            90,
            22
          ],
          "varname": "out_mute_default",
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "label_out_pause",
          "maxclass": "comment",
          "patching_rect": [40, 2490, 650, 23],
          "varname": "label_out_pause",
          "text": "PAUSE：总混音后以 50 ms 淡出／淡入；内部声音时间继续运行，CONTINUE 时回到当前演化位置。",
          "fontsize": 11,
          "fontface": 0
        }
      },
      {
        "box": {
          "id": "out_pause_receive",
          "maxclass": "newobj",
          "patching_rect": [40, 2520, 90, 22],
          "varname": "out_pause_receive",
          "text": "r ctl_pause"
        }
      },
      {
        "box": {
          "id": "out_pause_invert",
          "maxclass": "newobj",
          "patching_rect": [150, 2520, 45, 22],
          "varname": "out_pause_invert",
          "text": "!- 1"
        }
      },
      {
        "box": {
          "id": "out_pause_pack",
          "maxclass": "newobj",
          "patching_rect": [215, 2520, 80, 22],
          "varname": "out_pause_pack",
          "text": "pack 0. 50"
        }
      },
      {
        "box": {
          "id": "out_pause_line",
          "maxclass": "newobj",
          "patching_rect": [315, 2520, 65, 22],
          "varname": "out_pause_line",
          "text": "line~ 1."
        }
      }
    ],
    "lines": [
      {"patchline": {"source": ["rec_stop_receive", 0], "destination": ["rec_stop_message", 0]}},
      {"patchline": {"source": ["rec_stop_message", 0], "destination": ["rec_player", 0]}},
      {"patchline": {"source": ["reset_stop_receive", 0], "destination": ["reset_stop_send", 0]}},
      {"patchline": {"source": ["transform_raw_receive", 0], "destination": ["ui_transform", 0]}},
      {"patchline": {"source": ["density_raw_receive", 0], "destination": ["ui_density", 0]}},
      {"patchline": {"source": ["voice_raw_receive", 0], "destination": ["ui_voice", 0]}},
      {"patchline": {"source": ["gesture_x_raw_receive", 0], "destination": ["ui_gesture_x", 0]}},
      {"patchline": {"source": ["gesture_y_raw_receive", 0], "destination": ["ui_gesture_y", 0]}},
      {"patchline": {"source": ["hold_raw_receive", 0], "destination": ["ui_hold", 0]}},
      {"patchline": {"source": ["ui_pause", 0], "destination": ["pause_send", 0]}},
      {"patchline": {"source": ["pause_state_receive", 0], "destination": ["pause_state_set", 0]}},
      {"patchline": {"source": ["pause_state_set", 0], "destination": ["ui_pause", 0]}},
      {"patchline": {"source": ["pause_default", 0], "destination": ["ui_pause", 0]}},
      {"patchline": {"source": ["reset_pause_receive", 0], "destination": ["reset_pause_value", 0]}},
      {"patchline": {"source": ["reset_pause_value", 0], "destination": ["ui_pause", 0]}},
      {"patchline": {"source": ["ui_reset", 0], "destination": ["reset_send", 0]}},
      {"patchline": {"source": ["reset_scene_receive", 0], "destination": ["reset_scene_value", 0]}},
      {"patchline": {"source": ["reset_scene_value", 0], "destination": ["reset_scene_send", 0]}},
      {"patchline": {"source": ["reset_preset_receive", 0], "destination": ["scene_preset_reset", 0]}},
      {"patchline": {"source": ["reset_master_receive", 0], "destination": ["reset_master_value", 0]}},
      {"patchline": {"source": ["reset_master_value", 0], "destination": ["ui_master_remote", 0]}},
      {"patchline": {"source": ["reset_mute_receive", 0], "destination": ["reset_mute_value", 0]}},
      {"patchline": {"source": ["reset_mute_value", 0], "destination": ["ui_mute_remote", 0]}},
      {"patchline": {"source": ["scene_select", 0], "destination": ["scene_preset_s1", 0]}},
      {"patchline": {"source": ["scene_select", 1], "destination": ["scene_preset_s2", 0]}},
      {"patchline": {"source": ["scene_select", 2], "destination": ["scene_preset_s3", 0]}},
      {"patchline": {"source": ["scene_select", 3], "destination": ["scene_preset_return", 0]}},
      {"patchline": {"source": ["scene_preset_s1", 0], "destination": ["scene_preset_unpack", 0]}},
      {"patchline": {"source": ["scene_preset_s2", 0], "destination": ["scene_preset_unpack", 0]}},
      {"patchline": {"source": ["scene_preset_s3", 0], "destination": ["scene_preset_unpack", 0]}},
      {"patchline": {"source": ["scene_preset_return", 0], "destination": ["scene_preset_unpack", 0]}},
      {"patchline": {"source": ["scene_preset_reset", 0], "destination": ["scene_preset_unpack", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 0], "destination": ["preset_transform_send", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 1], "destination": ["preset_density_send", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 2], "destination": ["preset_voice_send", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 3], "destination": ["preset_x_send", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 4], "destination": ["preset_y_send", 0]}},
      {"patchline": {"source": ["scene_preset_unpack", 5], "destination": ["preset_hold_send", 0]}},
      {"patchline": {"source": ["out_pause_receive", 0], "destination": ["out_pause_invert", 0]}},
      {"patchline": {"source": ["out_pause_invert", 0], "destination": ["out_pause_pack", 0]}},
      {"patchline": {"source": ["out_pause_pack", 0], "destination": ["out_pause_line", 0]}},
      {"patchline": {"source": ["out_pause_line", 0], "destination": ["out_pause_gain_l", 1]}},
      {"patchline": {"source": ["out_pause_line", 0], "destination": ["out_pause_gain_r", 1]}},
      {"patchline": {"source": ["out_pause_gain_l", 0], "destination": ["out_master", 0]}},
      {"patchline": {"source": ["out_pause_gain_r", 0], "destination": ["out_master", 1]}},
      {"patchline": {"source": ["osc_route", 10], "destination": ["osc_pause_send", 0]}},
      {"patchline": {"source": ["osc_route", 11], "destination": ["osc_reset_sel", 0]}},
      {"patchline": {"source": ["osc_reset_sel", 0], "destination": ["osc_reset_send", 0]}},
      {
        "patchline": {
          "source": [
            "rec_adc",
            0
          ],
          "destination": [
            "rec_record",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_adc",
            0
          ],
          "destination": [
            "rec_meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_record",
            0
          ],
          "destination": [
            "rec_control_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_control_receive",
            0
          ],
          "destination": [
            "rec_select",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_select",
            0
          ],
          "destination": [
            "rec_start_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_select",
            1
          ],
          "destination": [
            "rec_stop_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_start_order",
            2
          ],
          "destination": [
            "rec_clear",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_clear",
            0
          ],
          "destination": [
            "rec_buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_start_order",
            1
          ],
          "destination": [
            "rec_timer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_start_order",
            0
          ],
          "destination": [
            "rec_record",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_stop_order",
            1
          ],
          "destination": [
            "rec_record",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_stop_order",
            0
          ],
          "destination": [
            "rec_timer",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_timer",
            0
          ],
          "destination": [
            "rec_duration",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_duration",
            0
          ],
          "destination": [
            "rec_duration_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_clear",
            0
          ],
          "destination": [
            "rec_clear",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_play",
            0
          ],
          "destination": [
            "rec_play_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_play_receive",
            0
          ],
          "destination": [
            "rec_duration_store",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_duration_receive",
            0
          ],
          "destination": [
            "rec_duration_store",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_duration_store",
            0
          ],
          "destination": [
            "rec_start_prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_start_prepend",
            0
          ],
          "destination": [
            "rec_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_player",
            0
          ],
          "destination": [
            "rec_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_level",
            0
          ],
          "destination": [
            "rec_send_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rec_level",
            0
          ],
          "destination": [
            "rec_send_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mcp_server",
            0
          ],
          "destination": [
            "mcp_thispatcher",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s1",
            0
          ],
          "destination": [
            "ui_s1_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s2",
            0
          ],
          "destination": [
            "ui_s2_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s3",
            0
          ],
          "destination": [
            "ui_s3_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_return",
            0
          ],
          "destination": [
            "ui_return_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s1_value",
            0
          ],
          "destination": [
            "scene_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s2_value",
            0
          ],
          "destination": [
            "scene_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_s3_value",
            0
          ],
          "destination": [
            "scene_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_return_value",
            0
          ],
          "destination": [
            "scene_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_unpack",
            0
          ],
          "destination": [
            "scene_s1_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_s1_pack",
            0
          ],
          "destination": [
            "scene_s1_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_unpack",
            1
          ],
          "destination": [
            "scene_s2_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_s2_pack",
            0
          ],
          "destination": [
            "scene_s2_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_unpack",
            2
          ],
          "destination": [
            "scene_s3_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_s3_pack",
            0
          ],
          "destination": [
            "scene_s3_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_receive",
            0
          ],
          "destination": [
            "scene_select",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            0
          ],
          "destination": [
            "scene_gain_s1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            1
          ],
          "destination": [
            "scene_gain_s2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            2
          ],
          "destination": [
            "scene_gain_s3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            3
          ],
          "destination": [
            "scene_gain_off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            4
          ],
          "destination": [
            "scene_gain_off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_s1",
            0
          ],
          "destination": [
            "scene_gain_unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_s2",
            0
          ],
          "destination": [
            "scene_gain_unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_s3",
            0
          ],
          "destination": [
            "scene_gain_unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_gain_off",
            0
          ],
          "destination": [
            "scene_gain_unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_select",
            3
          ],
          "destination": [
            "scene_return_delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_return_delay",
            0
          ],
          "destination": [
            "scene_return_play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_display_receive",
            0
          ],
          "destination": [
            "ui_scene_display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scene_default",
            0
          ],
          "destination": [
            "scene_default_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_transform",
            0
          ],
          "destination": [
            "transform_norm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transform_norm",
            0
          ],
          "destination": [
            "transform_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transform_receive",
            0
          ],
          "destination": [
            "transform_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transform_default",
            0
          ],
          "destination": [
            "ui_transform",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_density",
            0
          ],
          "destination": [
            "density_norm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density_norm",
            0
          ],
          "destination": [
            "density_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density_receive",
            0
          ],
          "destination": [
            "density_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density_default",
            0
          ],
          "destination": [
            "ui_density",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_voice",
            0
          ],
          "destination": [
            "voice_norm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice_norm",
            0
          ],
          "destination": [
            "voice_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice_receive",
            0
          ],
          "destination": [
            "voice_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice_default",
            0
          ],
          "destination": [
            "ui_voice",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_gesture_x",
            0
          ],
          "destination": [
            "gesture_x_norm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_x_norm",
            0
          ],
          "destination": [
            "gesture_x_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_x_receive",
            0
          ],
          "destination": [
            "gesture_x_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_x_default",
            0
          ],
          "destination": [
            "ui_gesture_x",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_gesture_y",
            0
          ],
          "destination": [
            "gesture_y_norm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_y_norm",
            0
          ],
          "destination": [
            "gesture_y_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_y_receive",
            0
          ],
          "destination": [
            "gesture_y_value",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gesture_y_default",
            0
          ],
          "destination": [
            "ui_gesture_y",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_event_a",
            0
          ],
          "destination": [
            "event_a_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_event_b",
            0
          ],
          "destination": [
            "event_b_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_hold",
            0
          ],
          "destination": [
            "hold_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_udp",
            0
          ],
          "destination": [
            "osc_parse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_parse",
            0
          ],
          "destination": [
            "osc_trim",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_trim",
            0
          ],
          "destination": [
            "osc_root",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_root",
            0
          ],
          "destination": [
            "osc_route",
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
            "osc_stage_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_route",
            1
          ],
          "destination": [
            "osc_transform_clip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_transform_clip",
            0
          ],
          "destination": [
            "osc_transform_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_route",
            2
          ],
          "destination": [
            "osc_density_clip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_density_clip",
            0
          ],
          "destination": [
            "osc_density_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_route",
            3
          ],
          "destination": [
            "osc_voice_clip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_voice_clip",
            0
          ],
          "destination": [
            "osc_voice_send",
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
            "osc_xy_unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_xy_unpack",
            0
          ],
          "destination": [
            "osc_x_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_xy_unpack",
            1
          ],
          "destination": [
            "osc_y_send",
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
            "osc_event_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_event_sel",
            0
          ],
          "destination": [
            "osc_event_a_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_event_sel",
            1
          ],
          "destination": [
            "osc_event_b_send",
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
            "osc_record_send",
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
            "osc_play_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc_play_sel",
            0
          ],
          "destination": [
            "osc_play_send",
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
            "osc_mute_send",
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
            "osc_hold_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_scene",
            0
          ],
          "destination": [
            "s1_equal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_equal",
            0
          ],
          "destination": [
            "s1_change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_change",
            0
          ],
          "destination": [
            "s1_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_sel",
            0
          ],
          "destination": [
            "s1_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_start",
            0
          ],
          "destination": [
            "s1_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_sel",
            1
          ],
          "destination": [
            "s1_stop_delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_stop_delay",
            0
          ],
          "destination": [
            "s1_stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_stop",
            0
          ],
          "destination": [
            "s1_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_transform",
            0
          ],
          "destination": [
            "s1_speed_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_speed_scale",
            0
          ],
          "destination": [
            "s1_speed_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_speed_pack",
            0
          ],
          "destination": [
            "s1_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_speed_line",
            0
          ],
          "destination": [
            "s1_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_loop_zero",
            0
          ],
          "destination": [
            "s1_player",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_duration",
            0
          ],
          "destination": [
            "s1_player",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_player",
            0
          ],
          "destination": [
            "s1_voice_static",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_voice_static",
            0
          ],
          "destination": [
            "s1_voice_gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_voice",
            0
          ],
          "destination": [
            "s1_voice_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_voice_pack",
            0
          ],
          "destination": [
            "s1_voice_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_voice_line",
            0
          ],
          "destination": [
            "s1_voice_gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_event_a",
            0
          ],
          "destination": [
            "s1_reverse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_reverse",
            0
          ],
          "destination": [
            "s1_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_event_a",
            0
          ],
          "destination": [
            "s1_reverse_delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_reverse_delay",
            0
          ],
          "destination": [
            "s1_reverse_back",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_reverse_back",
            0
          ],
          "destination": [
            "s1_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_event_b",
            0
          ],
          "destination": [
            "s1_lurch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_lurch",
            0
          ],
          "destination": [
            "s1_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_event_b",
            0
          ],
          "destination": [
            "s1_lurch_delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_lurch_delay",
            0
          ],
          "destination": [
            "s1_lurch_back",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_lurch_back",
            0
          ],
          "destination": [
            "s1_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_density",
            0
          ],
          "destination": [
            "s1_rate_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_rate_scale",
            0
          ],
          "destination": [
            "s1_rate_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_rate_pack",
            0
          ],
          "destination": [
            "s1_rate_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_rate_line",
            0
          ],
          "destination": [
            "s1_lfo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_lfo",
            0
          ],
          "destination": [
            "s1_half",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_half",
            0
          ],
          "destination": [
            "s1_offset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_bed",
            0
          ],
          "destination": [
            "s1_bed_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_bed_level",
            0
          ],
          "destination": [
            "s1_bed_pulse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_offset",
            0
          ],
          "destination": [
            "s1_bed_pulse",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_voice_gain",
            0
          ],
          "destination": [
            "s1_mix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_bed_pulse",
            0
          ],
          "destination": [
            "s1_mix",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_gain_cmd",
            0
          ],
          "destination": [
            "s1_gain_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_mix",
            0
          ],
          "destination": [
            "s1_gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_gain_line",
            0
          ],
          "destination": [
            "s1_gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_gain",
            0
          ],
          "destination": [
            "s1_send_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_gain",
            0
          ],
          "destination": [
            "s1_send_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s1_gain",
            0
          ],
          "destination": [
            "s1_meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_scene",
            0
          ],
          "destination": [
            "s2_equal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_equal",
            0
          ],
          "destination": [
            "s2_change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_change",
            0
          ],
          "destination": [
            "s2_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_sel",
            0
          ],
          "destination": [
            "s2_metro_on",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_metro_on",
            0
          ],
          "destination": [
            "s2_metro",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_sel",
            1
          ],
          "destination": [
            "s2_metro_off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_metro_off",
            0
          ],
          "destination": [
            "s2_metro",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_density",
            0
          ],
          "destination": [
            "s2_interval_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_interval_scale",
            0
          ],
          "destination": [
            "s2_interval_int",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_interval_int",
            0
          ],
          "destination": [
            "s2_metro",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_metro",
            0
          ],
          "destination": [
            "s2_trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_event_a",
            0
          ],
          "destination": [
            "s2_trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_trigger",
            1
          ],
          "destination": [
            "s2_rand_len",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_rand_len",
            0
          ],
          "destination": [
            "s2_len_plus",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_transform",
            0
          ],
          "destination": [
            "s2_len_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_len_scale",
            0
          ],
          "destination": [
            "s2_len_int",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_len_int",
            0
          ],
          "destination": [
            "s2_len_plus",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_len_plus",
            0
          ],
          "destination": [
            "s2_start_len",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_trigger",
            0
          ],
          "destination": [
            "s2_rand_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_duration",
            0
          ],
          "destination": [
            "s2_duration_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_duration_scale",
            0
          ],
          "destination": [
            "s2_duration_int",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_duration_int",
            0
          ],
          "destination": [
            "s2_duration_min",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_duration_min",
            0
          ],
          "destination": [
            "s2_rand_start",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_rand_start",
            0
          ],
          "destination": [
            "s2_start_len",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_start_len",
            0
          ],
          "destination": [
            "s2_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_order",
            1
          ],
          "destination": [
            "s2_calc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_calc",
            1
          ],
          "destination": [
            "s2_end",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_calc",
            0
          ],
          "destination": [
            "s2_end",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_end",
            0
          ],
          "destination": [
            "s2_start_end",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_order",
            0
          ],
          "destination": [
            "s2_start_only",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_start_only",
            0
          ],
          "destination": [
            "s2_start_end",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_start_end",
            0
          ],
          "destination": [
            "s2_prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_prepend",
            0
          ],
          "destination": [
            "s2_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_y",
            0
          ],
          "destination": [
            "s2_cut_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_cut_scale",
            0
          ],
          "destination": [
            "s2_cut_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_cut_pack",
            0
          ],
          "destination": [
            "s2_cut_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_player",
            0
          ],
          "destination": [
            "s2_filter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_cut_line",
            0
          ],
          "destination": [
            "s2_filter",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_filter",
            0
          ],
          "destination": [
            "s2_slice_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_event_b",
            0
          ],
          "destination": [
            "s2_recall",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_recall",
            0
          ],
          "destination": [
            "s2_recall_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_recall_player",
            0
          ],
          "destination": [
            "s2_recall_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold",
            0
          ],
          "destination": [
            "s2_hold_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_sel",
            0
          ],
          "destination": [
            "s2_hold_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_sel",
            1
          ],
          "destination": [
            "s2_hold_stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_start",
            0
          ],
          "destination": [
            "s2_hold_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_stop",
            0
          ],
          "destination": [
            "s2_hold_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_speed",
            0
          ],
          "destination": [
            "s2_hold_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_zero",
            0
          ],
          "destination": [
            "s2_hold_player",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_end",
            0
          ],
          "destination": [
            "s2_hold_player",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_player",
            0
          ],
          "destination": [
            "s2_hold_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_slice_level",
            0
          ],
          "destination": [
            "s2_add_a",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_recall_level",
            0
          ],
          "destination": [
            "s2_add_a",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_add_a",
            0
          ],
          "destination": [
            "s2_add_b",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_hold_level",
            0
          ],
          "destination": [
            "s2_add_b",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_voice",
            0
          ],
          "destination": [
            "s2_voice_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_voice_pack",
            0
          ],
          "destination": [
            "s2_voice_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_add_b",
            0
          ],
          "destination": [
            "s2_voice_gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_voice_line",
            0
          ],
          "destination": [
            "s2_voice_gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_x",
            0
          ],
          "destination": [
            "s2_x_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_x_pack",
            0
          ],
          "destination": [
            "s2_x_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_x_line",
            0
          ],
          "destination": [
            "s2_pan_r",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_x_line",
            0
          ],
          "destination": [
            "s2_inv_mul",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_inv_mul",
            0
          ],
          "destination": [
            "s2_inv_add",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_inv_add",
            0
          ],
          "destination": [
            "s2_pan_l",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_voice_gain",
            0
          ],
          "destination": [
            "s2_pan_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_voice_gain",
            0
          ],
          "destination": [
            "s2_pan_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_noise",
            0
          ],
          "destination": [
            "s2_noise_filter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_noise_filter",
            0
          ],
          "destination": [
            "s2_noise_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_pan_l",
            0
          ],
          "destination": [
            "s2_mix_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_noise_level",
            0
          ],
          "destination": [
            "s2_mix_l",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_pan_r",
            0
          ],
          "destination": [
            "s2_mix_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_noise_level",
            0
          ],
          "destination": [
            "s2_mix_r",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_cmd",
            0
          ],
          "destination": [
            "s2_gain_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_mix_l",
            0
          ],
          "destination": [
            "s2_gain_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_mix_r",
            0
          ],
          "destination": [
            "s2_gain_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_line",
            0
          ],
          "destination": [
            "s2_gain_l",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_line",
            0
          ],
          "destination": [
            "s2_gain_r",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_l",
            0
          ],
          "destination": [
            "s2_send_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_r",
            0
          ],
          "destination": [
            "s2_send_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_l",
            0
          ],
          "destination": [
            "s2_meter_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s2_gain_r",
            0
          ],
          "destination": [
            "s2_meter_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_scene",
            0
          ],
          "destination": [
            "s3_equal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_equal",
            0
          ],
          "destination": [
            "s3_change",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_change",
            0
          ],
          "destination": [
            "s3_sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_sel",
            0
          ],
          "destination": [
            "s3_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_start",
            0
          ],
          "destination": [
            "s3_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_sel",
            1
          ],
          "destination": [
            "s3_stop_delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_stop_delay",
            0
          ],
          "destination": [
            "s3_stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_stop",
            0
          ],
          "destination": [
            "s3_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_transform",
            0
          ],
          "destination": [
            "s3_speed_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_speed_scale",
            0
          ],
          "destination": [
            "s3_speed_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_speed_pack",
            0
          ],
          "destination": [
            "s3_speed_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_speed_line",
            0
          ],
          "destination": [
            "s3_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_transform",
            0
          ],
          "destination": [
            "s3_cut_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_cut_scale",
            0
          ],
          "destination": [
            "s3_cut_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_cut_pack",
            0
          ],
          "destination": [
            "s3_cut_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_cut_line",
            0
          ],
          "destination": [
            "s3_filter",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_zero",
            0
          ],
          "destination": [
            "s3_player",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_duration",
            0
          ],
          "destination": [
            "s3_player",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_player",
            0
          ],
          "destination": [
            "s3_filter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_filter",
            0
          ],
          "destination": [
            "s3_static",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_static",
            0
          ],
          "destination": [
            "s3_voice_gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_voice",
            0
          ],
          "destination": [
            "s3_voice_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_voice_pack",
            0
          ],
          "destination": [
            "s3_voice_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_voice_line",
            0
          ],
          "destination": [
            "s3_voice_gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_event_a",
            0
          ],
          "destination": [
            "s3_oracle",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_oracle",
            0
          ],
          "destination": [
            "s3_cut_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_event_b",
            0
          ],
          "destination": [
            "s3_recall",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_recall",
            0
          ],
          "destination": [
            "s3_recall_player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_recall_player",
            0
          ],
          "destination": [
            "s3_recall_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_voice_gain",
            0
          ],
          "destination": [
            "s3_voice_mix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_recall_level",
            0
          ],
          "destination": [
            "s3_voice_mix",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_bed_a",
            0
          ],
          "destination": [
            "s3_bed_a_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_bed_b",
            0
          ],
          "destination": [
            "s3_bed_b_level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_bed_a_level",
            0
          ],
          "destination": [
            "s3_bed_mix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_bed_b_level",
            0
          ],
          "destination": [
            "s3_bed_mix",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_voice_mix",
            0
          ],
          "destination": [
            "s3_mix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_bed_mix",
            0
          ],
          "destination": [
            "s3_mix",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_gain_cmd",
            0
          ],
          "destination": [
            "s3_gain_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_mix",
            0
          ],
          "destination": [
            "s3_gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_gain_line",
            0
          ],
          "destination": [
            "s3_gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_gain",
            0
          ],
          "destination": [
            "s3_send_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_gain",
            0
          ],
          "destination": [
            "s3_send_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "s3_gain",
            0
          ],
          "destination": [
            "s3_meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_original_l",
            0
          ],
          "destination": [
            "out_l_add1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s1_l",
            0
          ],
          "destination": [
            "out_l_add1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_l_add1",
            0
          ],
          "destination": [
            "out_l_add2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s2_l",
            0
          ],
          "destination": [
            "out_l_add2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_l_add2",
            0
          ],
          "destination": [
            "out_l_add3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s3_l",
            0
          ],
          "destination": [
            "out_l_add3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_original_r",
            0
          ],
          "destination": [
            "out_r_add1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s1_r",
            0
          ],
          "destination": [
            "out_r_add1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_r_add1",
            0
          ],
          "destination": [
            "out_r_add2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s2_r",
            0
          ],
          "destination": [
            "out_r_add2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_r_add2",
            0
          ],
          "destination": [
            "out_r_add3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_s3_r",
            0
          ],
          "destination": [
            "out_r_add3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_master_remote",
            0
          ],
          "destination": [
            "master_remote_scale",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "master_remote_scale",
            0
          ],
          "destination": [
            "ui_master_db",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_master_db",
            0
          ],
          "destination": [
            "master_remote_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "master_remote_default",
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
            "ui_mute_remote",
            0
          ],
          "destination": [
            "mute_remote_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mute_remote_state_receive",
            0
          ],
          "destination": [
            "mute_remote_state_set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mute_remote_state_set",
            0
          ],
          "destination": [
            "ui_mute_remote",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "master_remote_receive",
            0
          ],
          "destination": [
            "out_master",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_l_add3",
            0
          ],
          "destination": [
            "out_pause_gain_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_r_add3",
            0
          ],
          "destination": [
            "out_pause_gain_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_master",
            0
          ],
          "destination": [
            "out_clip_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_master",
            1
          ],
          "destination": [
            "out_clip_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui_mute",
            0
          ],
          "destination": [
            "out_mute_send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_receive",
            0
          ],
          "destination": [
            "mute_bottom_state_set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mute_bottom_state_set",
            0
          ],
          "destination": [
            "ui_mute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_default",
            0
          ],
          "destination": [
            "ui_mute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_receive",
            0
          ],
          "destination": [
            "out_invert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_invert",
            0
          ],
          "destination": [
            "out_mute_pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_pack",
            0
          ],
          "destination": [
            "out_mute_line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_clip_l",
            0
          ],
          "destination": [
            "out_gain_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_clip_r",
            0
          ],
          "destination": [
            "out_gain_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_line",
            0
          ],
          "destination": [
            "out_gain_l",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_mute_line",
            0
          ],
          "destination": [
            "out_gain_r",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_gain_l",
            0
          ],
          "destination": [
            "out_meter_l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_gain_r",
            0
          ],
          "destination": [
            "out_meter_r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_gain_l",
            0
          ],
          "destination": [
            "out_dac",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "out_gain_r",
            0
          ],
          "destination": [
            "out_dac",
            1
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
