import mc from 'minecraftstatuspinger';

async function main() {
    try {
        const { status: { players } } = await mc.lookup({
            host: 'localhost',
            port: 25565
        });
        console.log(players.online > 0);
    } catch (e) {
        console.log(false);
    }
};

main();