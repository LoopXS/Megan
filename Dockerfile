# Ultroid - UserBot
# Copyright (C) 2021-2022 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Tehran
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \

    && git clone https://github.com/LoopXS/Megan.git /root/LoopXS/ \
    && pip3 install --no-cache-dir -r root/LoopXS/requirements.txt \
    && pip3 uninstall av -y && pip3 install av --no-binary av \
    && pip3 install --no-cache-dir -r root/LoopXS/resources/startup/optional-requirements.txt

COPY installer.sh .

RUN bash installer.sh

# changing workdir
WORKDIR "/root/LoopXS"

# start the bot.
CMD ["bash", "startup"]
