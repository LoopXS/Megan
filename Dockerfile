# Ultroid - UserBot
# Copyright (C) 2021-2022 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Tehran
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone https://github.com/LoopXS/Megan.git /root/LoopXS/
RUN pip3 install --no-cache-dir -r root/LoopXS/resources/startup/optional-requirements.txt
# && git clone https://github.com/LoopXS/Fenix.git /root/LoopXS/ && pip3 install --no-cache-dir -U -r root/LoopXS/requirements.txt && pip3 uninstall av -y && pip3 install av --no-binary av
RUN pip3 install --no-cache-dir pytgcalls==3.0.0.dev21
RUN git clone https://github.com/LoopXS/Fenixer
# RUN pip3 install --no-cache-dir -r /root/LoopXS/requirements.txt
RUN pip3 uninstall av -y
RUN pip3 install av --no-binary av
RUN pip3 install -q --no-cache-dir yt-dlp
RUN curl https://get.okteto.com -sSfL | sh
# changing workdir
WORKDIR "/root/LoopXS"

# start the bot.
CMD ["bash", "startup"]
