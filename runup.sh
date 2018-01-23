
#!/bin/sh

echo "RunUp..." 
echo ""

SOURCESDIR=./runup_source_files

case $1 in
	install)
		echo "Install"
        echo ""
        git submodule init
        git submodule update
        cd laradock/
        #cp env-example .env
        docker-compose up -d workspace
        docker-compose exec --user=laradock workspace composer create-project laravel/laravel $SOURCESDIR --prefer-dist
        cp -Rf $SOURCESDIR/* ./
        rm -Rf $SOURCESDIR/
        chmod -R 777 ./bootstrap/cache/
        chmod -R 777 ./storage/
        #docker-compose down workspace
        #docker-compose up -d workspace
        
		;;
	reclone)
		echo "Re-clone gitrepo"
		git clone git@github.com:madeinnordeste/runup.git .
		;;
	*)
		echo "Sorry :( I don't understand"
		;;
esac