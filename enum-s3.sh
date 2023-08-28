#!/bin/bash
# a file named s3-names.txt should be present before running this script which has names of S3 buckets.
while read -r line
do
        echo $line
        aws s3api get-bucket-acl --bucket $line --query 'Grants[?(Grantee.URI==`http://acs.amazonaws.com/groups/global/AllUsers`)]'
        echo "----------------------------------------------------------------------"
done < s3-names.txt
