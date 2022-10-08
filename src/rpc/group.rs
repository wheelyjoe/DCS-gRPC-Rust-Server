use super::MissionRpc;
use stubs::group::v0::group_service_server::GroupService;
use stubs::*;
use tonic::{Request, Response, Status};

#[tonic::async_trait]
impl GroupService for MissionRpc {
    async fn get_units(
        &self,
        request: Request<group::v0::GetUnitsRequest>,
    ) -> Result<Response<group::v0::GetUnitsResponse>, Status> {
        let res = self.request("getUnits", request).await?;
        Ok(Response::new(res))
    }
    async fn is_exist(
        &self,
        request: Request<group::v0::IsExistRequest>,
    ) -> Result<Response<group::v0::IsExistResponse>, Status> {
        let res = self.request("isExist", request).await?;
        Ok(Response::new(res))
    }
}
