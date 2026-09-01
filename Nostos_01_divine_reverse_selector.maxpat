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
        "rect": [ 0.0, 0.0, 2500.0, 1000.0 ],
        "boxes": [
            {
                "box": {
                    "id": "box-mcp_server",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
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
                        "rect": [ 55.0, 113.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 100.0, 110.0, 22.0 ],
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
                                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 67.0, 150.0, 520.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 210.0, 170.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 129.625, 244.0, 150.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 192.25, 277.0, 160.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 332.0, 140.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 505.375, 244.0, 150.0, 22.0 ],
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
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 317.5, 193.0, 60.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 317.5, 224.0, 55.0, 35.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 374.5, 224.0, 54.0, 35.0 ],
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
                                    "patching_rect": [ 380.0, 308.0, 120.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 442.75, 187.0, 100.0, 22.0 ],
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
                                    "patching_rect": [ 442.75, 277.0, 160.0, 22.0 ],
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
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 204.5, 383.0, 300.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "autostart": 1,
                                        "defer": 0,
                                        "node_bin_path": "",
                                        "npm_bin_path": "",
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
                                    "patching_rect": [ 223.82501200000002, 468.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 340.0, 120.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 380.0, 140.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 442.75, 220.0, 180.0, 22.0 ],
                                    "text": "/pong"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 410.0, 140.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 440.0, 120.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 254.875, 470.0, 120.0, 22.0 ],
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 510.0, 111.0, 22.0 ],
                                    "text": "prepend clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 545.0, 125.0, 22.0 ],
                                    "text": "prepend windows"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-43",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 580.0, 111.0, 22.0 ],
                                    "text": "prepend front"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 615.0, 118.0, 22.0 ],
                                    "text": "prepend script"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-45",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 650.0, 118.0, 22.0 ],
                                    "text": "prepend script"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 67.0, 685.0, 118.0, 22.0 ],
                                    "text": "prepend script"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-maxpacket-init",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 620.0, 277.0, 210.0, 22.0 ],
                                    "text": "loadmess maxpacketsize 60000",
                                    "varname": "mcp_udp_init"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "order": 0,
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "midpoints": [ 452.25, 262.0, 427.0, 262.0, 427.0, 295.0, 364.0, 295.0, 364.0, 319.0, 214.0, 319.0 ],
                                    "order": 1,
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "midpoints": [ 214.0, 406.0, 52.0, 406.0, 52.0, 145.0, 76.5, 145.0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-2", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-2", 7 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
                                    "source": [ "obj-2", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-2", 8 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-2", 9 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "source": [ "obj-2", 10 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-2", 11 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-2", 12 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-2", 13 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-2", 14 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "source": [ "obj-2", 15 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-2", 16 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-2", 17 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-2", 18 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-2", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-2", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-2", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-39", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-45", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-7", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-maxpacket-init", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 3609.0, 46.0, 81.0, 22.0 ],
                    "text": "p mcp_server",
                    "varname": "mcp_server"
                }
            },
            {
                "box": {
                    "id": "box-mcp_thisp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 3609.0, 79.0, 90.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher",
                    "varname": "mcp_thisp"
                }
            },
            {
                "box": {
                    "id": "box-cmt_1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1240.0, 525.0, 197.0, 23.0 ],
                    "text": "MASTER VOLUME（总输出增益）",
                    "varname": "label_master_gain"
                }
            },
            {
                "box": {
                    "id": "box-gain_0",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1270.0, 560.0, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "gain_0",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "gain_0",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "master_gain"
                }
            },
            {
                "box": {
                    "id": "box-oracle_cutoff_reset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1585.0, 255.0, 39.0, 22.0 ],
                    "text": "250.",
                    "varname": "oracle_cutoff_reset"
                }
            },
            {
                "box": {
                    "id": "box-oracle_components_note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1930.0, 620.0, 380.0, 50.0 ],
                    "text": "组件含义：lores~ 是带共振的低通滤波器；line~ 让截止频率平滑移动；独立音量包络和安全链避免停止时残留直流与突然爆音。",
                    "varname": "oracle_components_note"
                }
            },
            {
                "box": {
                    "id": "box-oracle_listening_note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 845.0, 430.0, 50.0 ],
                    "text": "试听顺序：先 START FILTER，听见暗而模糊的循环；再点 RUN ORACLE，让高频内容缓慢显现。一次只改变一个参数，并记录它更像“启示”“命令”还是普通滤波器。",
                    "varname": "oracle_listening_note"
                }
            },
            {
                "box": {
                    "id": "box-oracle_default_time",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2070.0, 785.0, 105.0, 22.0 ],
                    "text": "loadmess 10000",
                    "varname": "oracle_default_time"
                }
            },
            {
                "box": {
                    "id": "box-oracle_default_res",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1760.0, 785.0, 93.0, 22.0 ],
                    "text": "loadmess 0.7",
                    "varname": "oracle_default_res"
                }
            },
            {
                "box": {
                    "id": "box-oracle_default_hz",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 785.0, 99.0, 22.0 ],
                    "text": "loadmess 3500.",
                    "varname": "oracle_default_hz"
                }
            },
            {
                "box": {
                    "id": "box-oracle_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1905.0, 665.0, 18.0, 85.0 ],
                    "varname": "oracle_meter"
                }
            },
            {
                "box": {
                    "id": "box-oracle_limiter",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1785.0, 710.0, 91.0, 22.0 ],
                    "text": "clip~ -0.8 0.8",
                    "varname": "oracle_limiter"
                }
            },
            {
                "box": {
                    "id": "box-oracle_safe_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1785.0, 665.0, 55.0, 22.0 ],
                    "text": "*~ 0.12",
                    "varname": "oracle_safe_gain"
                }
            },
            {
                "box": {
                    "id": "box-oracle_amp",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1785.0, 620.0, 36.0, 22.0 ],
                    "text": "*~",
                    "varname": "oracle_amp"
                }
            },
            {
                "box": {
                    "id": "box-oracle_amp_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1930.0, 570.0, 57.0, 22.0 ],
                    "text": "line~ 0.",
                    "varname": "oracle_amp_line"
                }
            },
            {
                "box": {
                    "id": "box-oracle_filter",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1785.0, 570.0, 105.0, 22.0 ],
                    "text": "lores~ 250. 0.7",
                    "varname": "oracle_filter"
                }
            },
            {
                "box": {
                    "id": "box-oracle_cutoff_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1785.0, 480.0, 71.0, 22.0 ],
                    "text": "line~ 250.",
                    "varname": "oracle_cutoff_line"
                }
            },
            {
                "box": {
                    "id": "box-oracle_sweep_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1660.0, 480.0, 91.0, 22.0 ],
                    "text": "250., $1 $2",
                    "varname": "oracle_sweep_message"
                }
            },
            {
                "box": {
                    "id": "box-oracle_run_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1625.0, 530.0, 125.0, 20.0 ],
                    "text": "RUN ORACLE",
                    "varname": "oracle_run_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_run",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1585.0, 525.0, 30.0, 30.0 ],
                    "varname": "oracle_run"
                }
            },
            {
                "box": {
                    "id": "box-oracle_param_store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1585.0, 480.0, 42.0, 22.0 ],
                    "text": "zl reg",
                    "varname": "oracle_param_store"
                }
            },
            {
                "box": {
                    "id": "box-oracle_params",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 480.0, 116.0, 22.0 ],
                    "text": "pak 3500. 10000",
                    "varname": "oracle_params"
                }
            },
            {
                "box": {
                    "id": "box-oracle_time_note",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2070.0, 408.0, 260.0, 37.0 ],
                    "text": "短＝突然揭示；长＝声音像被神缓慢允许进入人间。建议 3000–15000。",
                    "varname": "oracle_time_note"
                }
            },
            {
                "box": {
                    "id": "box-oracle_time_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2175.0, 378.0, 105.0, 22.0 ],
                    "text": "clip 500 20000",
                    "varname": "oracle_time_clip"
                }
            },
            {
                "box": {
                    "id": "box-oracle_sweep_ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2070.0, 378.0, 90.0, 22.0 ],
                    "varname": "oracle_sweep_ms"
                }
            },
            {
                "box": {
                    "id": "box-oracle_time_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2070.0, 350.0, 250.0, 23.0 ],
                    "text": "参数3：显现时间（ms）",
                    "varname": "oracle_time_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_res_note",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1760.0, 408.0, 260.0, 37.0 ],
                    "text": "0＝柔和自然；接近1＝频率被突出，可能像执拗的命令或带音高的神谕。",
                    "varname": "oracle_res_note"
                }
            },
            {
                "box": {
                    "id": "box-oracle_res_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1865.0, 378.0, 70.0, 22.0 ],
                    "text": "clip 0. 1.",
                    "varname": "oracle_res_clip"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "box-oracle_resonance",
                    "maxclass": "flonum",
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1760.0, 378.0, 90.0, 22.0 ],
                    "varname": "oracle_resonance"
                }
            },
            {
                "box": {
                    "id": "box-oracle_res_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1760.0, 350.0, 240.0, 23.0 ],
                    "text": "参数2：共振强度（0–1）",
                    "varname": "oracle_res_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_target_note",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 408.0, 260.0, 37.0 ],
                    "text": "低值＝语言被遮住，只剩暗色轮廓；高值＝辅音与明亮细节逐渐显现。",
                    "varname": "oracle_target_note"
                }
            },
            {
                "box": {
                    "id": "box-oracle_target_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1555.0, 378.0, 96.0, 22.0 ],
                    "text": "clip 200. 6000.",
                    "varname": "oracle_target_clip"
                }
            },
            {
                "box": {
                    "id": "box-oracle_target_hz",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1450.0, 378.0, 90.0, 22.0 ],
                    "varname": "oracle_target_hz"
                }
            },
            {
                "box": {
                    "id": "box-oracle_target_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 350.0, 260.0, 23.0 ],
                    "text": "参数1：目标截止频率（Hz）",
                    "varname": "oracle_target_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_fade_stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1690.0, 170.0, 53.0, 22.0 ],
                    "text": "0. 100",
                    "varname": "oracle_fade_stop"
                }
            },
            {
                "box": {
                    "id": "box-oracle_stop_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1730.0, 130.0, 210.0, 23.0 ],
                    "text": "STOP FILTER（100 ms 淡停）",
                    "varname": "oracle_stop_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_stop",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1690.0, 125.0, 30.0, 30.0 ],
                    "varname": "oracle_stop"
                }
            },
            {
                "box": {
                    "id": "box-oracle_player",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 1450.0, 300.0, 188.0, 22.0 ],
                    "text": "groove~ voice 1 @loop 1",
                    "varname": "oracle_player"
                }
            },
            {
                "box": {
                    "id": "box-oracle_speed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1450.0, 255.0, 57.0, 22.0 ],
                    "text": "line~ 1.",
                    "varname": "oracle_speed_line"
                }
            },
            {
                "box": {
                    "id": "box-oracle_fade_in",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1585.0, 210.0, 49.0, 22.0 ],
                    "text": "1. 50",
                    "varname": "oracle_fade_in"
                }
            },
            {
                "box": {
                    "id": "box-oracle_startloop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1500.0, 210.0, 66.0, 22.0 ],
                    "text": "startloop",
                    "varname": "oracle_startloop"
                }
            },
            {
                "box": {
                    "id": "box-oracle_speed_normal",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 210.0, 33.0, 22.0 ],
                    "text": "1.",
                    "varname": "oracle_speed_normal"
                }
            },
            {
                "box": {
                    "id": "box-oracle_start_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 1450.0, 170.0, 66.0, 22.0 ],
                    "text": "t b b b b",
                    "varname": "oracle_start_order"
                }
            },
            {
                "box": {
                    "id": "box-oracle_start_label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1490.0, 130.0, 222.0, 23.0 ],
                    "text": "START FILTER：正常速度循环当前选区",
                    "varname": "oracle_start_label"
                }
            },
            {
                "box": {
                    "id": "box-oracle_start",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1450.0, 125.0, 30.0, 30.0 ],
                    "varname": "oracle_start"
                }
            },
            {
                "box": {
                    "id": "box-oracle_instructions",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 62.0, 808.0, 37.0 ],
                    "text": "这是与倒放并列的独立实验。它使用同一个 voice buffer 和同一波形选区，但有自己的播放器与输出。试听前先按旧区域的 STOP，避免两路声音混合。",
                    "varname": "oracle_instructions"
                }
            },
            {
                "box": {
                    "id": "box-oracle_title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 24.0, 700.0, 23.0 ],
                    "text": "Nostos 01B — 神界：神谕滤镜（缓慢选择与显现）",
                    "varname": "oracle_title"
                }
            },
            {
                "box": {
                    "id": "box-note_voice_recorder",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1070.0, 415.0, 358.0, 23.0 ],
                    "text": "record~ voice 1：把单声道麦克风信号写入名为 voice 的 buffer~。",
                    "varname": "note_voice_recorder"
                }
            },
            {
                "box": {
                    "id": "box-note_record_stop_order",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1070.0, 345.0, 316.0, 23.0 ],
                    "text": "t b b b：停止 record~ → 取消自动计时 → 稍后刷新波形。",
                    "varname": "note_record_stop_order"
                }
            },
            {
                "box": {
                    "id": "box-note_record_auto_stop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1070.0, 313.0, 287.0, 23.0 ],
                    "text": "delay 12000：录音达到12秒时自动关闭 RECORD。",
                    "varname": "note_record_auto_stop"
                }
            },
            {
                "box": {
                    "id": "box-note_record_start_order",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1070.0, 268.0, 275.0, 37.0 ],
                    "text": "t b b b b：按安全顺序执行 停止播放 → 清空旧声音 → 开始录音 → 启动12秒计时。",
                    "varname": "note_record_start_order"
                }
            },
            {
                "box": {
                    "id": "box-note_record_router",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1070.0, 235.0, 307.0, 23.0 ],
                    "text": "sel 1 0：把 RECORD 的开始和停止分成两条控制路径。",
                    "varname": "note_record_router"
                }
            },
            {
                "box": {
                    "id": "box-note_material_selection",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 356.0, 325.0, 50.0 ],
                    "text": "材料参数：选区约 300–1200 ms 通常仍像一个词；更短会趋向音节/纹理，更长会像短语。它不是效果器参数，而是神夺走了哪一块语言。",
                    "varname": "note_material_selection"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_defaults",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 825.0, 932.0, 330.0, 23.0 ],
                    "text": "以上三个 loadmess 只负责打开 Patch 时填入默认值。",
                    "varname": "note_reverse_defaults"
                }
            },
            {
                "box": {
                    "id": "box-reverse_default_acceleration",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 565.0, 930.0, 93.0, 22.0 ],
                    "text": "loadmess 5000",
                    "varname": "reverse_default_acceleration"
                }
            },
            {
                "box": {
                    "id": "box-reverse_default_speed",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 930.0, 93.0, 22.0 ],
                    "text": "loadmess -0.8",
                    "varname": "reverse_default_speed"
                }
            },
            {
                "box": {
                    "id": "box-reverse_default_deceleration",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 930.0, 93.0, 22.0 ],
                    "text": "loadmess 5000",
                    "varname": "reverse_default_deceleration"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_param_flow",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 825.0, 858.0, 484.0, 23.0 ],
                    "text": "pak 收集三个参数；zl reg 暂存；按钮触发后，message 把它们翻译成 line~ 的速度轨迹。",
                    "varname": "note_reverse_param_flow"
                }
            },
            {
                "box": {
                    "id": "box-reverse_custom_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1055.0, 827.0, 126.0, 22.0 ],
                    "text": "1., 0. $1 $2 $3",
                    "varname": "reverse_custom_message"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_custom_run",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1025.0, 782.0, 105.0, 20.0 ],
                    "text": "RUN CUSTOM",
                    "varname": "label_reverse_custom_run"
                }
            },
            {
                "box": {
                    "id": "box-reverse_custom_run",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 985.0, 776.0, 30.0, 30.0 ],
                    "varname": "reverse_custom_run"
                }
            },
            {
                "box": {
                    "id": "box-reverse_param_store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 985.0, 827.0, 42.0, 22.0 ],
                    "text": "zl reg",
                    "varname": "reverse_param_store"
                }
            },
            {
                "box": {
                    "id": "box-reverse_param_pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 825.0, 827.0, 137.0, 22.0 ],
                    "text": "pak 5000 -0.8 5000",
                    "varname": "reverse_param_pack"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_acceleration",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 858.0, 235.0, 50.0 ],
                    "text": "建议 1500–8000。短＝立即反击；长＝先悬停，再被不可逆地拖向过去。",
                    "varname": "note_reverse_acceleration"
                }
            },
            {
                "box": {
                    "id": "box-reverse_acceleration_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 827.0, 98.0, 22.0 ],
                    "text": "clip 300 15000",
                    "varname": "reverse_acceleration_clip"
                }
            },
            {
                "box": {
                    "id": "box-reverse_acceleration_ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 565.0, 827.0, 80.0, 22.0 ],
                    "varname": "reverse_acceleration_ms"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_acceleration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 565.0, 800.0, 245.0, 23.0 ],
                    "text": "参数3：从停止进入倒放的时间（ms）",
                    "varname": "label_reverse_acceleration"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_target_speed",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 858.0, 235.0, 50.0 ],
                    "text": "建议 -0.5 至 -1.0。接近 0＝更慢更低沉；-1＝原速倒放；低于 -1＝更快更尖锐。",
                    "varname": "note_reverse_target_speed"
                }
            },
            {
                "box": {
                    "id": "box-reverse_target_speed_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 395.0, 827.0, 91.0, 22.0 ],
                    "text": "clip -2. -0.1",
                    "varname": "reverse_target_speed_clip"
                }
            },
            {
                "box": {
                    "id": "box-reverse_target_speed",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 300.0, 827.0, 80.0, 22.0 ],
                    "varname": "reverse_target_speed"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_target_speed",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 800.0, 245.0, 23.0 ],
                    "text": "参数2：倒放目标速度（必须为负数）",
                    "varname": "label_reverse_target_speed"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_deceleration",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 858.0, 235.0, 50.0 ],
                    "text": "建议 1500–8000。短＝突然夺取；长＝缓慢扭曲命运。clip 强制限制在 300–15000。",
                    "varname": "note_reverse_deceleration"
                }
            },
            {
                "box": {
                    "id": "box-reverse_deceleration_clip",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 130.0, 827.0, 98.0, 22.0 ],
                    "text": "clip 300 15000",
                    "varname": "reverse_deceleration_clip"
                }
            },
            {
                "box": {
                    "id": "box-reverse_deceleration_ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 35.0, 827.0, 80.0, 22.0 ],
                    "varname": "reverse_deceleration_ms"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_deceleration",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 800.0, 210.0, 23.0 ],
                    "text": "参数1：减速到停止时间（ms）",
                    "varname": "label_reverse_deceleration"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_custom",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 764.0, 805.0, 23.0 ],
                    "text": "调整数值只会保存设置；点击右侧 RUN CUSTOM 才会执行。执行前先点上方 RESET + START，让词语从正放开始。",
                    "varname": "note_reverse_custom"
                }
            },
            {
                "box": {
                    "id": "box-title_reverse_custom",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 735.0, 430.0, 23.0 ],
                    "text": "需要你调试的三个核心参数（一次只改一个）",
                    "varname": "title_reverse_custom"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_listening",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 645.0, 519.0, 23.0 ],
                    "text": "试听重点：停住前是否像声音被抓住？进入倒放后是“命运扭转”，还是只像磁带/恐怖片？",
                    "varname": "note_reverse_listening"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_safety",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 570.0, 360.0, 23.0 ],
                    "text": "安全链：先衰减到 15%，再限制在 ±0.8。本实验没有反馈回路。",
                    "varname": "note_reverse_safety"
                }
            },
            {
                "box": {
                    "id": "box-label_audio_output",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1321.0, 745.5, 82.0, 23.0 ],
                    "text": "音频开关",
                    "varname": "label_audio_output"
                }
            },
            {
                "box": {
                    "id": "box-main_dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1266.0, 732.5, 45.0, 45.0 ],
                    "varname": "main_dac"
                }
            },
            {
                "box": {
                    "id": "box-reverse_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 648.0, 557.0, 18.0, 85.0 ],
                    "varname": "reverse_meter"
                }
            },
            {
                "box": {
                    "id": "box-reverse_limiter",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 530.0, 597.0, 91.0, 22.0 ],
                    "text": "clip~ -0.8 0.8",
                    "varname": "reverse_limiter"
                }
            },
            {
                "box": {
                    "id": "box-reverse_safe_gain",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 530.0, 557.0, 55.0, 22.0 ],
                    "text": "*~ 0.15",
                    "varname": "reverse_safe_gain"
                }
            },
            {
                "box": {
                    "id": "box-playback_stop_for_record",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 235.0, 37.0, 22.0 ],
                    "text": "stop",
                    "varname": "playback_stop_for_record"
                }
            },
            {
                "box": {
                    "id": "box-note_recording_safety",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 447.0, 250.0, 37.0 ],
                    "text": "麦克风没有连接到扬声器；录音开始前会自动清空旧内容，停止后自动刷新波形。",
                    "varname": "note_recording_safety"
                }
            },
            {
                "box": {
                    "id": "box-label_mic_meter",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 995.0, 372.0, 65.0, 23.0 ],
                    "text": "输入电平",
                    "varname": "label_mic_meter"
                }
            },
            {
                "box": {
                    "id": "box-mic_meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1017.0, 260.0, 18.0, 105.0 ],
                    "varname": "mic_meter"
                }
            },
            {
                "box": {
                    "id": "box-voice_recorder",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 850.0, 415.0, 97.0, 22.0 ],
                    "text": "record~ voice 1",
                    "varname": "voice_recorder"
                }
            },
            {
                "box": {
                    "id": "box-waveform_set_voice",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 918.0, 380.0, 64.0, 22.0 ],
                    "text": "set voice",
                    "varname": "waveform_set_voice"
                }
            },
            {
                "box": {
                    "id": "box-waveform_refresh_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 850.0, 380.0, 58.0, 22.0 ],
                    "text": "delay 50",
                    "varname": "waveform_refresh_delay"
                }
            },
            {
                "box": {
                    "id": "box-record_cancel_timer",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 957.0, 345.0, 37.0, 22.0 ],
                    "text": "stop",
                    "varname": "record_cancel_timer"
                }
            },
            {
                "box": {
                    "id": "box-record_stop_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 917.0, 345.0, 30.0, 22.0 ],
                    "text": "0",
                    "varname": "record_stop_message"
                }
            },
            {
                "box": {
                    "id": "box-record_stop_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 850.0, 345.0, 52.0, 22.0 ],
                    "text": "t b b b",
                    "varname": "record_stop_order"
                }
            },
            {
                "box": {
                    "id": "box-record_toggle_off",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 938.0, 307.0, 30.0, 22.0 ],
                    "text": "0",
                    "varname": "record_toggle_off"
                }
            },
            {
                "box": {
                    "id": "box-record_auto_stop_delay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 850.0, 307.0, 78.0, 22.0 ],
                    "text": "delay 12000",
                    "varname": "record_auto_stop_delay"
                }
            },
            {
                "box": {
                    "id": "box-record_start_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 968.0, 272.0, 30.0, 22.0 ],
                    "text": "1",
                    "varname": "record_start_message"
                }
            },
            {
                "box": {
                    "id": "box-record_clear_message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 917.0, 272.0, 41.0, 22.0 ],
                    "text": "clear",
                    "varname": "record_clear_message"
                }
            },
            {
                "box": {
                    "id": "box-record_start_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 850.0, 272.0, 66.0, 22.0 ],
                    "text": "t b b b b",
                    "varname": "record_start_order"
                }
            },
            {
                "box": {
                    "id": "box-record_state_router",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 850.0, 235.0, 50.0, 22.0 ],
                    "text": "sel 1 0",
                    "varname": "record_state_router"
                }
            },
            {
                "box": {
                    "id": "box-label_record_toggle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 895.0, 192.0, 232.0, 23.0 ],
                    "text": "② RECORD：打开后朗读，读完立即关闭",
                    "varname": "label_record_toggle"
                }
            },
            {
                "box": {
                    "id": "box-record_toggle",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 850.0, 185.0, 34.0, 34.0 ],
                    "varname": "record_toggle"
                }
            },
            {
                "box": {
                    "id": "box-label_mic_dsp",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 905.0, 137.0, 185.0, 23.0 ],
                    "text": "① 点击打开麦克风和 DSP",
                    "varname": "label_mic_dsp"
                }
            },
            {
                "box": {
                    "id": "box-mic_input",
                    "maxclass": "ezadc~",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 850.0, 125.0, 45.0, 45.0 ],
                    "varname": "mic_input"
                }
            },
            {
                "box": {
                    "id": "box-title_recording",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 850.0, 92.0, 190.0, 23.0 ],
                    "text": "现场录音（最长12秒）",
                    "varname": "title_recording"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_player",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 730.0, 512.0, 360.0, 23.0 ],
                    "text": "groove~ 读取选区；正数正放，0 停住，负数倒放",
                    "varname": "note_reverse_player"
                }
            },
            {
                "box": {
                    "id": "box-reverse_player",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 530.0, 510.0, 188.0, 22.0 ],
                    "text": "groove~ voice 1 @loop 1",
                    "varname": "reverse_player"
                }
            },
            {
                "box": {
                    "id": "box-note_reverse_speed_line",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 596.0, 465.0, 180.0, 23.0 ],
                    "text": "line~ 平滑改变播放速度",
                    "varname": "note_reverse_speed_line"
                }
            },
            {
                "box": {
                    "id": "box-reverse_speed_line",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 530.0, 463.0, 57.0, 22.0 ],
                    "text": "line~ 1.",
                    "varname": "reverse_speed_line"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_stop",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 97.0, 664.0, 145.0, 23.0 ],
                    "text": "STOP（100 ms 淡停）",
                    "varname": "label_reverse_stop"
                }
            },
            {
                "box": {
                    "id": "box-reverse_stop_ramp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 662.0, 53.0, 22.0 ],
                    "text": "0. 100",
                    "varname": "reverse_stop_ramp"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_slow",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 237.0, 617.0, 250.0, 23.0 ],
                    "text": "缓慢：长期操纵、时间尺度更非人",
                    "varname": "label_reverse_slow"
                }
            },
            {
                "box": {
                    "id": "box-reverse_preset_slow",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 615.0, 193.0, 22.0 ],
                    "text": "1., 0. 10000 -0.5 10000",
                    "varname": "reverse_preset_slow"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_medium",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 213.0, 582.0, 280.0, 23.0 ],
                    "text": "中等：命运被强行扭转（当前设计基准）",
                    "varname": "label_reverse_medium"
                }
            },
            {
                "box": {
                    "id": "box-reverse_preset_medium",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 580.0, 169.0, 22.0 ],
                    "text": "1., 0. 5000 -0.8 5000",
                    "varname": "reverse_preset_medium"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_fast",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 195.0, 547.0, 165.0, 23.0 ],
                    "text": "快速：暴怒、粗暴夺取",
                    "varname": "label_reverse_fast"
                }
            },
            {
                "box": {
                    "id": "box-reverse_preset_fast",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 545.0, 151.0, 22.0 ],
                    "text": "1., 0. 1500 -1. 1500",
                    "varname": "reverse_preset_fast"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_presets",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 515.0, 380.0, 23.0 ],
                    "text": "④ 先听清正放的词，再点击一种时间翻转：",
                    "varname": "label_reverse_presets"
                }
            },
            {
                "box": {
                    "id": "box-reverse_startloop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 145.0, 463.0, 66.0, 22.0 ],
                    "text": "startloop",
                    "varname": "reverse_startloop"
                }
            },
            {
                "box": {
                    "id": "box-reverse_speed_normal",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 96.0, 463.0, 33.0, 22.0 ],
                    "text": "1.",
                    "varname": "reverse_speed_normal"
                }
            },
            {
                "box": {
                    "id": "box-reverse_reset_order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 35.0, 463.0, 43.0, 22.0 ],
                    "text": "t b b",
                    "varname": "reverse_reset_order"
                }
            },
            {
                "box": {
                    "id": "box-label_reverse_reset_start",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 72.0, 424.0, 400.0, 23.0 ],
                    "text": "③ RESET + START：先恢复正常速度，再从选区起点开始",
                    "varname": "label_reverse_reset_start"
                }
            },
            {
                "box": {
                    "id": "box-reverse_reset_start",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 35.0, 420.0, 28.0, 28.0 ],
                    "varname": "reverse_reset_start"
                }
            },
            {
                "box": {
                    "id": "box-label_selection_end",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 390.0, 165.0, 23.0 ],
                    "text": "选区终点 ms（材料边界）",
                    "varname": "label_selection_end"
                }
            },
            {
                "box": {
                    "id": "box-selection_end_ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 235.0, 365.0, 86.0, 22.0 ],
                    "varname": "selection_end_ms"
                }
            },
            {
                "box": {
                    "id": "box-label_selection_start",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 390.0, 165.0, 23.0 ],
                    "text": "选区起点 ms（材料边界）",
                    "varname": "label_selection_start"
                }
            },
            {
                "box": {
                    "id": "box-selection_start_ms",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 35.0, 365.0, 86.0, 22.0 ],
                    "varname": "selection_start_ms"
                }
            },
            {
                "box": {
                    "id": "box-note_waveform_select",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 330.0, 570.0, 23.0 ],
                    "text": "③ 用鼠标在波形中拖选一个词（Select 模式，不会改写声音）。边界吸附到零交叉点，以减少循环爆音。",
                    "varname": "note_waveform_select"
                }
            },
            {
                "box": {
                    "buffername": "voice",
                    "id": "box-voice_waveform",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 35.0, 135.0, 790.0, 190.0 ],
                    "setmode": 1,
                    "snapto": 2,
                    "varname": "voice_waveform"
                }
            },
            {
                "box": {
                    "id": "box-voice_buffer",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 245.0, 96.0, 139.0, 22.0 ],
                    "text": "buffer~ voice 12000 1",
                    "varname": "voice_buffer"
                }
            },
            {
                "box": {
                    "id": "box-note_load_audio",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 126.0, 98.0, 116.0, 23.0 ],
                    "text": "可选：载入已有语音",
                    "varname": "note_load_audio"
                }
            },
            {
                "box": {
                    "id": "box-load_audio_replace",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 96.0, 82.0, 22.0 ],
                    "text": "replace",
                    "varname": "load_audio_replace"
                }
            },
            {
                "box": {
                    "id": "box-instructions_main",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 57.0, 1015.0, 23.0 ],
                    "text": "操作顺序：① 打开麦克风/DSP  ② 打开 RECORD、朗读一句话、再关闭 RECORD  ③ 在波形上拖选一个词  ④ RESET + START  ⑤ 选择预设或在下方调试参数。",
                    "varname": "instructions_main"
                }
            },
            {
                "box": {
                    "id": "box-title_main",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 24.0, 650.0, 23.0 ],
                    "text": "Nostos 01 — 神界：嫉妒之神扭转一个词",
                    "varname": "title_main"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "box-main_dac", 1 ],
                    "source": [ "box-gain_0", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-main_dac", 0 ],
                    "source": [ "box-gain_0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_buffer", 0 ],
                    "source": [ "box-load_audio_replace", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-mcp_thisp", 0 ],
                    "source": [ "box-mcp_server", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-mic_meter", 0 ],
                    "order": 0,
                    "source": [ "box-mic_input", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_recorder", 0 ],
                    "order": 1,
                    "source": [ "box-mic_input", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_safe_gain", 0 ],
                    "source": [ "box-oracle_amp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_amp", 1 ],
                    "source": [ "box-oracle_amp_line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_filter", 1 ],
                    "source": [ "box-oracle_cutoff_line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_cutoff_line", 0 ],
                    "source": [ "box-oracle_cutoff_reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_target_hz", 0 ],
                    "source": [ "box-oracle_default_hz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_resonance", 0 ],
                    "source": [ "box-oracle_default_res", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_sweep_ms", 0 ],
                    "source": [ "box-oracle_default_time", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_amp_line", 0 ],
                    "source": [ "box-oracle_fade_in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_amp_line", 0 ],
                    "order": 0,
                    "source": [ "box-oracle_fade_stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_speed_line", 0 ],
                    "order": 1,
                    "source": [ "box-oracle_fade_stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_amp", 0 ],
                    "source": [ "box-oracle_filter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-gain_0", 1 ],
                    "order": 1,
                    "source": [ "box-oracle_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-gain_0", 0 ],
                    "order": 2,
                    "source": [ "box-oracle_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_meter", 0 ],
                    "order": 0,
                    "source": [ "box-oracle_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_sweep_message", 0 ],
                    "source": [ "box-oracle_param_store", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_param_store", 1 ],
                    "source": [ "box-oracle_params", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_filter", 0 ],
                    "source": [ "box-oracle_player", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_filter", 2 ],
                    "source": [ "box-oracle_res_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_res_clip", 0 ],
                    "source": [ "box-oracle_resonance", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_param_store", 0 ],
                    "source": [ "box-oracle_run", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_limiter", 0 ],
                    "source": [ "box-oracle_safe_gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_player", 0 ],
                    "source": [ "box-oracle_speed_line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_speed_line", 0 ],
                    "source": [ "box-oracle_speed_normal", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_start_order", 0 ],
                    "source": [ "box-oracle_start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_cutoff_reset", 0 ],
                    "source": [ "box-oracle_start_order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_fade_in", 0 ],
                    "source": [ "box-oracle_start_order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_speed_normal", 0 ],
                    "source": [ "box-oracle_start_order", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_startloop", 0 ],
                    "source": [ "box-oracle_start_order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_player", 0 ],
                    "source": [ "box-oracle_startloop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_fade_stop", 0 ],
                    "source": [ "box-oracle_stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_cutoff_line", 0 ],
                    "source": [ "box-oracle_sweep_message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_time_clip", 0 ],
                    "source": [ "box-oracle_sweep_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_params", 0 ],
                    "source": [ "box-oracle_target_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_target_clip", 0 ],
                    "source": [ "box-oracle_target_hz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_params", 1 ],
                    "source": [ "box-oracle_time_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_player", 0 ],
                    "source": [ "box-playback_stop_for_record", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_toggle_off", 0 ],
                    "source": [ "box-record_auto_stop_delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_auto_stop_delay", 0 ],
                    "source": [ "box-record_cancel_timer", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_buffer", 0 ],
                    "source": [ "box-record_clear_message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_recorder", 0 ],
                    "source": [ "box-record_start_message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-playback_stop_for_record", 0 ],
                    "source": [ "box-record_start_order", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_auto_stop_delay", 0 ],
                    "source": [ "box-record_start_order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_clear_message", 0 ],
                    "source": [ "box-record_start_order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_start_message", 0 ],
                    "source": [ "box-record_start_order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_start_order", 0 ],
                    "source": [ "box-record_state_router", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_stop_order", 0 ],
                    "source": [ "box-record_state_router", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_recorder", 0 ],
                    "source": [ "box-record_stop_message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_cancel_timer", 0 ],
                    "source": [ "box-record_stop_order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_stop_message", 0 ],
                    "source": [ "box-record_stop_order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-waveform_refresh_delay", 0 ],
                    "source": [ "box-record_stop_order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_state_router", 0 ],
                    "source": [ "box-record_toggle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-record_toggle", 0 ],
                    "source": [ "box-record_toggle_off", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_param_pack", 2 ],
                    "source": [ "box-reverse_acceleration_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_acceleration_clip", 0 ],
                    "source": [ "box-reverse_acceleration_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_custom_message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_param_store", 0 ],
                    "source": [ "box-reverse_custom_run", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_param_pack", 0 ],
                    "source": [ "box-reverse_deceleration_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_deceleration_clip", 0 ],
                    "source": [ "box-reverse_deceleration_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_acceleration_ms", 0 ],
                    "source": [ "box-reverse_default_acceleration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_deceleration_ms", 0 ],
                    "source": [ "box-reverse_default_deceleration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_target_speed", 0 ],
                    "source": [ "box-reverse_default_speed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-gain_0", 1 ],
                    "order": 0,
                    "source": [ "box-reverse_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-gain_0", 0 ],
                    "order": 1,
                    "source": [ "box-reverse_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_meter", 0 ],
                    "order": 2,
                    "source": [ "box-reverse_limiter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_param_store", 1 ],
                    "source": [ "box-reverse_param_pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_custom_message", 0 ],
                    "source": [ "box-reverse_param_store", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_safe_gain", 0 ],
                    "source": [ "box-reverse_player", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_preset_fast", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_preset_medium", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_preset_slow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_normal", 0 ],
                    "source": [ "box-reverse_reset_order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_startloop", 0 ],
                    "source": [ "box-reverse_reset_order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_reset_order", 0 ],
                    "source": [ "box-reverse_reset_start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_limiter", 0 ],
                    "source": [ "box-reverse_safe_gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_player", 0 ],
                    "source": [ "box-reverse_speed_line", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_speed_normal", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_player", 0 ],
                    "source": [ "box-reverse_startloop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_speed_line", 0 ],
                    "source": [ "box-reverse_stop_ramp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_target_speed_clip", 0 ],
                    "source": [ "box-reverse_target_speed", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_param_pack", 1 ],
                    "source": [ "box-reverse_target_speed_clip", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_player", 2 ],
                    "order": 0,
                    "source": [ "box-selection_end_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_player", 2 ],
                    "order": 1,
                    "source": [ "box-selection_end_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-oracle_player", 1 ],
                    "order": 0,
                    "source": [ "box-selection_start_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-reverse_player", 1 ],
                    "order": 1,
                    "source": [ "box-selection_start_ms", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-selection_end_ms", 0 ],
                    "source": [ "box-voice_waveform", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-selection_start_ms", 0 ],
                    "source": [ "box-voice_waveform", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-waveform_set_voice", 0 ],
                    "source": [ "box-waveform_refresh_delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "box-voice_waveform", 0 ],
                    "source": [ "box-waveform_set_voice", 0 ]
                }
            }
        ],
        "parameters": {
            "box-gain_0": [ "gain_0", "gain_0", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}