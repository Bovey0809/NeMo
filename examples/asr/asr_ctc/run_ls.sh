#!/bin/bash
python speech_to_text_ctc_bpe_ts.py \
model.tokenizer.type=bpe \
model.tokenizer.dir=/home/yangzhang/code/ts_asr/tokenizer_ls/tokenizer_spe_unigram_v128/ \
model.train_ds.manifest_filepath=/home/yangzhang/code/ts_asr/train_all.json \
model.train_ds.augmentor.rir_noise_speaker.rir_manifest_path=/mnt/data/rir_noises/rir_tarred/tarred/tarred_audio_manifest.json \
model.train_ds.augmentor.rir_noise_speaker.rir_tar_filepaths=/mnt/data/rir_noises/rir_tarred/tarred/audio_{0..127}.tar \
model.train_ds.augmentor.rir_noise_speaker.noise_manifest_paths=[/mnt/data/rir_noises/noises_20s_tarred/tarred_audio_manifest.json] \
model.train_ds.augmentor.rir_noise_speaker.noise_tar_filepaths=[/mnt/data/rir_noises/noises_20s_tarred/audio_{0..255}.tar] \
model.train_ds.augmentor.rir_noise_speaker.bg_noise_manifest_paths=[/mnt/data/rir_noises/noises_20s_tarred/tarred_audio_manifest.json] \
model.train_ds.augmentor.rir_noise_speaker.bg_noise_tar_filepaths=[/mnt/data/rir_noises/noises_20s_tarred/audio_{0..255}.tar] \
trainer.max_epochs=1 \
model.validation_ds.manifest_filepath=/home/yangzhang/code/ts_asr/dev_clean.json \
model.train_ds.max_duration=20 \
model.train_ds.num_workers=0 \
model.validation_ds.num_workers=0 \
model.test_ds.num_workers=0 \
trainer.gpus=1 \
+nemo_checkpoint_path=/home/yangzhang/code/ts_asr/stt_en_conformer_ctc_large_v1.0.0/stt_en_conformer_ctc_large.nemo

# trainer.num_sanity_val_steps=2 \


# model.encoder.d_model=256 \
# model.encoder.n_heads=4 \
# model.encoder.n_layers=18 \
# model.spec_augment.time_masks=5 \
# +nemo_checkpoint_path=/home/yangzhang/code/ts_asr/stt_en_conformer_ctc_medium_v1.0.0/stt_en_conformer_ctc_medium.nemo