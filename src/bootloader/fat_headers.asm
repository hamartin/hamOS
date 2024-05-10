;
; FAT12 header
; https://wiki.osdev.org/FAT#Boot_Record
;
bpd_oem:                        db "MSWIN4.1"				; This can be set to whatever, but the documentation says to set
									;	it to MSWIN4.1 for maximum compatibility. Make sure the
									;	string is 8 bytes.
bpd_bytes_per_sector:           dw 512
bpd_sectors_per_cluster:        db 1
bpd_reserved_sectors:           dw 1
bpd_fat_count:                  db 2
bpd_dir_entries_count:          dw 0xe0
bpd_total_sectors:              dw 2880					; Since we are creating a "floppy"
									;	2880 sectors * 512 bytes = 1.44MB
bpd_media_descriptor_type:      db 0xf0					; The f0 type matches the 3.5" floppy disk.
bpd_sectors_per_fat:            dw 9					; Number of sectors per allocation table.
bpd_sectors_per_track:          dw 18
bpd_heads:                      dw 2
bpd_hidden_sectors:             dd 0
bpd_large_sector_count:         dd 0

; extended boot record
ebr_drive_number:               db 0
                                db 0
ebr_signature:                  db 0x29
ebr_volume_id:                  db 0x12, 0x34, 0x56, 0x78		; These 4 bytes you set to something random.
ebr_volume_label:               db "hamOS      "
ebr_system_id:                  db "FAT12   "
